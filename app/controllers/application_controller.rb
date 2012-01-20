class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  #LogIn Redirect
  before_filter :require_login


  #######PRIVATE_METHOD########
  private

    def require_login
      unless current_user
        redirect_to '/pages/index.html'
      end
    end
  
  
end
