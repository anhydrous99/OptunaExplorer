class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_subdomain, if: :devise_controller?
  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, Apartment::TenantNotFound, with: :render_404

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def ensure_subdomain
    if request.subdomain != 'www'
      redirect_to subdomain: 'www'
    end
  end

  private

  def render_404(_exception)
    render 'errors/not_found'
  end
end
