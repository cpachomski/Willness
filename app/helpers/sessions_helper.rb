module SessionsHelper

  #adds user id to session when create action is hit
  def log_in(user)
    session[:user_id] = user.id
  end

  # creates remember_digest for user and saves it in cookies with hashed user_id for 20 years!!!!!!!!
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #removes user id from session and removes current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #creates current user from session or cookies and checks if remember token is correct then logs in
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end

  #returns true if user is logged in
  def logged_in?
    !current_user.nil?
  end

end
