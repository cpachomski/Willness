module UsersHelper


  def setup_client
    consumer_key = Rails.application.secrets.fitbit_key
    consumer_secret = Rails.application.secrets.fitbit_secret

    client = Fitgem::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret})
    request_token = client.request_token
    token = request_token.token
    secret = request_token.secret



    access_token = client.authorize(token, secret, {:oauth_verifier => verifier})

    puts "verifier = " + verifier
    puts "token = " + access_token.token
    puts "secret =" + access_token.secret

    return {:token => access_token.token, :secret => access_token.secret}
  end

  def user_steps

     setup_client[:token]

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
    # 5. use sub methods to do this stuff i guess




  end



end
