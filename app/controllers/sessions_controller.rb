class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log user in
      log_in(user)
      #redirect to user show page
      redirect_to user
    else
      #render error messages here
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
