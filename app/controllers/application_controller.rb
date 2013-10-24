class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_if_admin_is_logged_in
  	if !view_context.admin_is_logged_in?
  		redirect_to new_session_path
  	end
  end

  # def admin_is_logged_in?
  #   session[:user] != nil
  # end
end
