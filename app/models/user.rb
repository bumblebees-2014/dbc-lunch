class User < ActiveRecord::Base
  has_one :upcoming_lunch
  has_secure_password

end
