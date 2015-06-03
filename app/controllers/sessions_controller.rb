class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log user in
      log_in(user)
      #retain remember_token if user chose to stay logged in
      params[:session][:remember] == "1" ? remember(user) : forget(user)
      #redirect to user show page
      redirect_to user
    else
      #render error messages here
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
