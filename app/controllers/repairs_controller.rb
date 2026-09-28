class RepairsController < ApplicationController
  before_action :set_repair, only: %i[ show edit update destroy ]
  before_action :load_form_collections, only: %i[ new edit create update ]

  # A bike usually needs two or three jobs, so the intake form offers three empty lines.
  BLANK_LINES = 3

  def index
    @repairs = Repair.includes(bike: [ :bike_model, :customer ]).by_promise
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
    @repair = Repair.new(repair_params)

    if @repair.save
      redirect_to @repair, notice: "Repair ##{@repair.id} was booked in."
    else
      BLANK_LINES.times { @repair.repair_services.build } if @repair.repair_services.empty?
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @repair.update(repair_params)
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

  private

  def set_repair
    @repair = Repair.find(params[:id])
  end

  def load_form_collections
    @bikes    = Bike.includes(:bike_model).by_serial
    @staff    = User.by_name
    @services = Service.by_name
  end

  def repair_params
    params.expect(repair: [ :bike_id, :received_by_id, :quote_answered_by_id, :state,
                            :received_at, :promised_on, :quote_answered_at, :collected_at,
                            repair_services_attributes: [ [ :id, :service_id, :mechanic_id,
                                                            :charged_price, :completed_at,
                                                            :_destroy ] ] ])
  end
end
