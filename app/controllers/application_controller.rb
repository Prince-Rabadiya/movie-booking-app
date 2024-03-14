# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :handle_error

  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def error_handling
    yield
  rescue CanCan::AccessDenied => e
    redirect_to root_path, alert: e.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name email password password_confirmation
                                               current_password])
  end

  private

  def handle_error(exception)
    redirect_to root_path, alert: exception.message
  end
end
