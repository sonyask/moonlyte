class SessionsController < ApplicationController

  #skip_before_filter :require_login

  def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    if !user.nil? && user.authenticate(params[:password])# authenticated?
      sign_in user
      flash[:notice] = "LOGIN SUCCESS!"
      redirect_to user
    else
      flash.now[:error] = "Invalid username or password"
      render "new"
    end
  end
  
  def destroy
    sign_out
    redirect_to users_path, :notice => "Logged out!"
  end
  
end
