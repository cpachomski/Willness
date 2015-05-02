class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @daily_tasks = @user.tasks

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #create session and log_in when user signs up
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
