
class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Every route needs the token, unless its controller skips this for an action.
  before_action :require_token

  rescue_from ActiveRecord::RecordNotFound do |error|
    render_errors "#{error.model} #{error.id} does not exist", :not_found
  end

  rescue_from ActionController::ParameterMissing do |error|
    render_errors "The body has no #{error.param} to read", :bad_request
  end

  rescue_from ActionDispatch::Http::Parameters::ParseError do
    render_errors "The body is not valid JSON", :bad_request
  end

  rescue_from ActionController::BadRequest do |error|
    render_errors error.message, :bad_request
  end

  private

  def render_errors(messages, status)
    render json: { errors: Array(messages) }, status: status
  end

  def require_token
    return if authenticate_with_http_token { |token, _options| valid_token?(token) }

    response.headers["WWW-Authenticate"] = 'Bearer realm="Wheelhouse"'
    render_errors "A valid token is required: Authorization: Bearer <token>", :unauthorized
  end

  def valid_token?(token)
    expected = Rails.application.credentials.api_token.to_s
    expected.present? && ActiveSupport::SecurityUtils.secure_compare(token, expected)
  end
end
