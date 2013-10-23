class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.authenticate(params[:username], params[:password])
    if admin
      session[:user_id] = admin
      redirect_to root_url, :notice => "Welcome #{admin.username}"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end      
  end
end
