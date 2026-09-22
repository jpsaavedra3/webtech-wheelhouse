class BikesController < ApplicationController
  def index
    @bikes = Bike.includes(:bike_model, :customer).by_serial
  end

  def show
    @bike = Bike.includes(:bike_model, :customer).find(params[:id])
    @repairs = @bike.repairs.includes(bike: [ :bike_model, :customer ]).newest_first
  end
end
