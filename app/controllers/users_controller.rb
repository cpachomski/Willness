class UsersController < ApplicationController

  def show


      @user = User.find(current_user.id)
      @daily_tasks = @user.tasks

      #hardcoded my user id for now
      user_id = '2X5LVN'
      client = return_client(user_id)
      #user_info is a hash of all fitbit user data
      todays_activities = client.activities_on_date('today')
      @todays_steps = todays_activities['summary']['steps']
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
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end



end
