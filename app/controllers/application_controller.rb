class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  #LogIn Redirect
  #before_filter :require_login


  ####### PRIVATE_METHODS ########
  private

    def require_login
      unless signed_in?
        flash[:error] = "MUST SIGN IN"
        redirect_to root_path
        false
      end
    end
    
    # determines whether a given user is a moonlyter
    def is_moonlyter?(user_id)
      user = User.find_by_id(user_id)
         
      # returns true if user exists, and has a moonlyter profile
      !user.nil? && !user.moonlyter.nil?
    end
         
  
  
end
