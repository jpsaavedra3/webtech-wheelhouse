class CustomersController < ApplicationController
  def index
    @customers = Customer.includes(:bikes).by_name
  end

  def show
    @customer = Customer.find(params[:id])
    @bikes = @customer.bikes.includes(:bike_model, :customer).by_serial
  end
end
