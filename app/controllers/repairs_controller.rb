class RepairsController < ApplicationController
  before_action :set_repair, only: %i[ show edit update destroy ]
  before_action :load_form_collections, only: %i[ new edit create update ]
  before_action :set_repair, only: %i[ show edit update destroy remove_photo ]
  # A bike usually needs two or three jobs, so the intake form offers three empty lines.
  BLANK_LINES = 3

  def index
    @repairs = Repair.with_attached_intake_photos
                     .with_rich_text_diagnosis
                     .includes(bike: [ :bike_model, :customer ])
                     .by_promise
  end

  def show
    @lines = @repair.repair_services.includes(:service, :mechanic).in_order_added
  end

  def new
    @repair = Repair.new(bike_id: params[:bike_id],
                         received_at: Time.current,
                         promised_on: Date.current + 3)
    BLANK_LINES.times { @repair.repair_services.build }
  end

  def edit
    @repair.repair_services.build
  end

  def create
    @repair = Repair.new(repair_params.except(:intake_photos))
    add_intake_photos(@repair)

    if @repair.save
      redirect_to @repair, notice: "Repair ##{@repair.id} was booked in."
    else
      BLANK_LINES.times { @repair.repair_services.build } if @repair.repair_services.empty?
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @repair.assign_attributes(repair_params.except(:intake_photos))
    add_intake_photos(@repair)

    if @repair.save
      redirect_to @repair, notice: "Repair ##{@repair.id} was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @repair.destroy
      redirect_to repairs_path, notice: "The repair was deleted.", status: :see_other
    else
      redirect_to @repair, alert: @repair.errors.full_messages.to_sentence, status: :see_other
    end
  end

  def remove_photo
    photo = @repair.intake_photos.find(params[:photo_id])
    photo.purge

    redirect_to @repair, notice: "The photo was removed.", status: :see_other
  end

  private

    def set_repair
      @repair = Repair.with_attached_intake_photos.with_rich_text_diagnosis.find(params[:id])
    end

    def load_form_collections
      @bikes    = Bike.includes(:bike_model).by_serial
      @staff    = User.by_name
      @services = Service.by_name
    end

    def add_intake_photos(repair)
      chosen = Array(repair_params[:intake_photos]).reject(&:blank?)
      return if chosen.empty?

      repair.intake_photos = repair.intake_photos.blobs + chosen
    end

    def repair_params
      params.expect(repair: [ :bike_id, :received_by_id, :quote_answered_by_id, :state,
                              :received_at, :promised_on, :quote_answered_at, :collected_at,
                              :diagnosis,
                              intake_photos: [],
                              repair_services_attributes: [ [ :id, :service_id, :mechanic_id,
                                                              :charged_price, :completed_at,
                                                              :_destroy ] ] ])
    end
end
