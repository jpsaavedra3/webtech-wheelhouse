class ApplicationController < ActionController::Base
  include Authentication
  include Pundit::Authorization

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Every action asks a policy, and every index is built from a scope. An action that
  # forgets fails, in every controller, without writing a line in it.
  after_action :verify_policy_used

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  private

  # The policies receive the account of the session, and nothing else.
  def pundit_user
    Current.user if authenticated?
  end

  def verify_policy_used
    verify_authorized
    verify_policy_scoped if action_name == "index"
  end

  def forbidden
    render "errors/forbidden", status: :forbidden
  end
end
