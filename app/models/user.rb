class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true
  validates :email , presence: true, uniqueness: {case_sensitive: false}

end
