class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def check_admin_editing_permissions
    return if current_user.admin?
    flash[:warning] = 'Only admins can do that'
    redirect_to(root_path)
  end
end
