class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def layout_by_resource
    if devise_controller? 
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_dashboard_path(token: current_user.token)
    elsif current_user.customer?
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :role])
  end
end
