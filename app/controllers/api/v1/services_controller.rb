
class Api::V1::ServicesController < Api::V1::BaseController
  skip_before_action :require_token, only: %i[ index show ]

  def index
    services = Service.by_name
    repairs_counts = RepairService.group(:service_id).distinct.count(:repair_id)

    render json: services.map { |service| service_document(service, repairs_counts.fetch(service.id, 0)) }
  end

  def show
    service = Service.find(params[:id])

    render json: service_document(service, service.repair_services.distinct.count(:repair_id))
  end

  def create
    service = Service.new(service_params)

    if service.save
      render json: service_document(service, 0), status: :created, location: api_v1_service_url(service)
    else
      render_errors service.errors.full_messages, :unprocessable_entity
    end
  end

  private

  def service_params
    params.expect(service: [ :name, :description, :price ])
  end

  def service_document(service, repairs_count)
    {
      id: service.id,
      name: service.name,
      price: service.price.round,
      repairs_count: repairs_count
    }
  end
end