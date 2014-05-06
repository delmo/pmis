class ApplicationController < ActionController::Base
 
 #Pundit authorisation
 include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, :except => [:index], unless: :devise_controller? #skip devise controller checks
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
   flash[:alert] = "Access denied. You are not authorized to perform this action."
   redirect_to (request.referrer || root_path)
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:department_id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:department_id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password) }
   @department = Department.order("name ASC")
  end

end
