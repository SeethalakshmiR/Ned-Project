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
    case current_user.role
    when 'admin'
      root_path 
    # else
    #   customer_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :role])
  end
end
