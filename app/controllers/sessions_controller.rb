class SessionsController < ApplicationController

  def new
  end

  def create
    user = user.find_by(:email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log user in and redirect to show page
    else
      #render error messages
      render 'new'
    end
  end

end
