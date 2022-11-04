class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email bio photo password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email bio photo password current_password])
  end
end
