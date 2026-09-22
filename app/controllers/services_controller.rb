class ServicesController < ApplicationController
  def index
    @services = Service.by_name
  end

  def show
    @service = Service.find(params[:id])
    @lines = @service.repair_services.includes(repair: { bike: :bike_model }).newest_first
  end
end
