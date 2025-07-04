class ApplicationController < ActionController::Base

  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "No tienes permiso para acceder a esta página."
    redirect_to root_path
  end

end
