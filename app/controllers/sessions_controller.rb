class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.authenticate(params[:username], params[:password])
    if admin
      session[:user] = admin
      redirect_to admin_home_path, :notice => "Welcome #{admin.username}"
    else
      # flash.now.alert = "Invalid username or password"
      # render "new"
      redirect_to new_session_path, :notice => "Invalid username or password"
    end      
  end
  
  def destroy
    session[:user] = nil
    redirect_to root_url, :notice => "Bye bye!"
  end
end
