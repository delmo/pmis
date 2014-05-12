class ApplicationController < ActionController::Base
 
 #Pundit authorisation
 include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_user
  before_filter :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, :except => [:index], unless: :devise_controller? #skip devise controller checks
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  #sign out if the user is disabled
  def check_user
   if current_user && current_user.disabled?
     sign_out current_user 
     redirect_to root_path
     flash[:alert] = "Your account is not activated yet. Please contact the administrator."
   end
  end

  # check is user is not authorized
  def user_not_authorized
   flash[:alert] = "Access denied. You are not authorized to perform this action."
   redirect_to (request.referrer || root_path)
  end

  # allow only permitted parameter to avoid SQL injection
  # and other form attacks
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:department_id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:department_id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password) }
   @department = Department.order("name ASC")
  end

end
