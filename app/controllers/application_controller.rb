class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    if resource.admin?
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    else
      member_path(resource)
    end
  end

  def configure_permitted_parameters
    attributes = [:name, :block, :floor, :flat, :owner, :active, :rented, :email, :sec_email, :phone, :sec_phone, tenant_attributes: [:name, :email, :phone]]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
 end
end
