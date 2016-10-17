class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_pass_changed, if: :user_signed_in?, :except => [:change_pass, :update, :destroy]
  protect_from_forgery with: :exception


  layout 'admin_lte_2'

  def after_sign_in_path_for(resource_or_scope)
    dashboard_index_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado para acessar esse recurso."
    redirect_to(request.referrer || current_user)
  end

  def check_pass_changed
     unless !current_user.pass_changed
       redirect_to users_change_pass_path, alert: "Você deve alterar sua senha antes de acessar qualquer recurso do sistema."
     end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :avatar, :avatar_cache, :remove_avatar, :role, :plan_id, :full_name) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar, :role, :plan_id, :full_name) }
  end

end
