class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :config_devise_params, if: :devise_controller?

  def require_sign_in
  unless current_user
    flash[:alert] = "You must be logged in to do that"
    redirect_to root_path
  end

  def disable_header
    @disable_header = true
  end 
end

private
  def config_devise_params
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end
end
