module SessionsHelper

  #adds user id to session when create action is hit
  def log_in(user)
    session[:user_id] = user.id
  end

  #removes user id from session and removes current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #creates current user from session id if not present
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #returns true if user is logged in
  def logged_in?
    !current_user.nil?
  end



end
