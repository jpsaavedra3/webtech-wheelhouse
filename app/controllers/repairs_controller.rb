class RepairsController < ApplicationController
  def index
    @repairs = Repair.includes(bike: [ :bike_model, :customer ]).by_promise
  end

  def show
    @repair = Repair.includes(:received_by, :quote_answered_by, bike: [ :bike_model, :customer ]).find(params[:id])
    @lines = @repair.repair_services.includes(:service, :mechanic).in_order_added
  end
end
