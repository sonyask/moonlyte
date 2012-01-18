module UsersHelper
  def current_user
    user = User.find_by_id(session[:remember_token])
    if user.nil?
      123
    else
      user.id
    end
  end
end
