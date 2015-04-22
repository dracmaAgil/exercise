class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_paramaters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

    def configure_permitted_paramaters
      devise_parameter_sanitizer.for(:sign_up) { |a| a.permit(:user_name, :name, :birthday, :email, :password, :password_confirmation)}
      devise_parameter_sanitizer.for(:sign_in) { |a| a.permit(:user_name, :password, :remember_me)}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :user_name, :name, :birthday)}
    end

  private
    def after_sign_in_path_for(resource)
     # After you enter login info and click submit, I want you to be sent to the registrations#show page
     # new_user_session_path
     # profile_path
     root_path
   end
   def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
   end

end