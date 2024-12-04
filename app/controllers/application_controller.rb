class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from StandardError, with: :render_internal_server_error

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def render_not_found
    render template: "errors/404", status: :not_found, layout: false
  end

  def render_internal_server_error(exception)
    # Enregistre l'exception pour le débogage si nécessaire
    Rails.logger.error("Erreur 500 : #{exception.message}")

    # Rendre la page d'erreur 500
    render template: 'errors/500', status: :internal_server_error
  end
end
