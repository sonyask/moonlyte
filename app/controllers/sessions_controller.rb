class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    if !user.nil? && user.authenticate(params[:password])# authenticated?
      session[:user_id] = user.id
      flash[:notice] = "LOGIN SUCCESS!"
      redirect_to user_url(session[:user_id])
    else
      flash.now[:error] = "Invalid username or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
