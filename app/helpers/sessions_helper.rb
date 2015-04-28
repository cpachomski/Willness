module SessionsHelper

  #adds user id to session when create action is hit
  def log_in(user)
    session[:user_id] = user.id
  end

  #creates current user from session id if not present
  def current_user
    @current_user || = User.find_by(id: session[:user:id])
  end

  #returns true if user is logged in
  def logged_in
    !current_user.nil?
  end

end
