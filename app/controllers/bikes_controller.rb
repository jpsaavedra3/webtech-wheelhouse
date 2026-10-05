class BikesController < ApplicationController
  before_action :set_bike, only: %i[ show edit update destroy ]
  before_action :load_form_collections, only: %i[ new edit create update ]

  def index
    @bikes = Bike.includes(:bike_model, :customer).by_serial
  end

  def show
    @repairs = @bike.repairs
                    .with_attached_intake_photos
                    .with_rich_text_diagnosis
                    .includes(bike: [ :bike_model, :customer ])
                    .newest_first
  end

  def new
    @bike = Bike.new(customer_id: params[:customer_id])
  end

  def edit
  end

  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      redirect_to @bike, notice: "#{helpers.bike_label(@bike)} was added to the rack."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: "#{helpers.bike_label(@bike)} was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @bike.destroy
      redirect_to bikes_path, notice: "The bike was removed.", status: :see_other
    else
      redirect_to @bike, alert: @bike.errors.full_messages.to_sentence, status: :see_other
    end
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def load_form_collections
    @bike_models = BikeModel.by_name
    @customers   = Customer.by_name
  end

  def bike_params
    params.expect(bike: [ :bike_model_id, :customer_id, :serial_number, :colour ])
  end
end
