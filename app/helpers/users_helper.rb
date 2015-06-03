module UsersHelper




  def return_client(user_id)

    consumer_key = Rails.application.secrets.fitbit_key
    consumer_secret = Rails.application.secrets.fitbit_secret
    fitbit_token = Rails.application.secrets.fitbit_token
    fitbit_token_secret = Rails.application.secrets.fitbit_token_secret

    client = Fitgem::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret, :token => fitbit_token, :secret => fitbit_token_secret, :user_id => user_id})

  end

  # 1. create a current timestamsp
  # 2.  query the db for the current day for current user
  # 3.  query for the the steps in same query
  # 4.  set return daily steps variable
  # 5.  add to users show action

  def current_daily_steps

  end


  def set_user_dailydata
    # 1. grab all point values for tasks for that day
    # 2. grab all task names for tasks for that day
    # 3. grab all task descriptions for tasks for that day
    # 4. grab all completed for descriptions for that day
    # 5. use sub methods to do this stuff i gues
  end


  def todays_date
    date = Date.today
    return " #{date.strftime('%A')} - #{date.strftime('%B')} - #{date.strftime('%-d')} - #{date.strftime('%Y')}"
  end




end
