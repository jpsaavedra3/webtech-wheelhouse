
class Api::V1::RepairsController < Api::V1::BaseController
  def index
    repairs = filter_by_state(preloaded_repairs.by_promise)

    render json: repairs.map { |repair| repair_document(repair) }
  end

  def show
    render json: repair_document(preloaded_repairs.find(params[:id]))
  end

  private


  def preloaded_repairs
    Repair.includes(bike: [ :bike_model, :customer ], repair_services: :service)
  end

  def filter_by_state(repairs)
    return repairs unless params.key?(:state)

    unless Repair.states.key?(params[:state])
      raise ActionController::BadRequest, "state must be one of: #{Repair.states.keys.join(", ")}"
    end

    repairs.where(state: params[:state])
  end

  def repair_document(repair)
    lines = repair.repair_services.to_a
    bike  = repair.bike

    {
      id: repair.id,
      state: repair.state,
      received_on: repair.received_at.to_date,
      promised_on: repair.promised_on,
      collected_on: repair.collected_at&.to_date,
      customer_answer: customer_answer(repair, lines),
      overdue: repair.overdue?,
      total: lines.sum(&:charged_price).round,
      customer: { name: bike.customer.name },
      bike: { brand: bike.bike_model.brand, model: bike.bike_model.name, serial_number: bike.serial_number },
      lines: lines.map { |line| { service: line.service.name, charged_price: line.charged_price.round } }
    }
  end

  def customer_answer(repair, lines)
    return if repair.quote_answered_at.nil?

    said_no = repair.declined? || (repair.collected? && lines.none?(&:completed_at))
    said_no ? Repair.states[:declined] : Repair.states[:approved]
  end
end