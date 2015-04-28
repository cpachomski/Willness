class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password

  validates :username, uniqueness: true
  validates :email , presence: true, uniqueness: {case_sensitive: false}


  #returns hash digest of input string with different costs
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  #returns random token for remembering user
  def User.generate_remember_token
    SecureRandom.urlsafe_base64
  end

  #creates a remember_token for the current user and saves it in DB
  def remember
    self.remember_token = User.generate_remember_token
    update_attribute(:remember_digest, User.digest(remember_token)
  end

end
