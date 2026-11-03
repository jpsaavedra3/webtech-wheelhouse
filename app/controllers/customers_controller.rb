class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  def index
    authorize Customer
    @customers = policy_scope(Customer).includes(:bikes).by_name
  end

  def show
    @bikes = @customer.bikes.includes(:bike_model, :customer).by_serial
  end

  def new
    authorize Customer
    @customer = Customer.new
  end

  def edit
  end

  def create
    authorize Customer
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: "#{@customer.name} was added to the customer list."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "#{@customer.name} was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: "#{@customer.name} was removed.", status: :see_other
    else
      redirect_to @customer, alert: @customer.errors.full_messages.to_sentence, status: :see_other
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
    authorize @customer
  end

  def customer_params
    params.expect(customer: [ :name, :phone ])
  end
end
