class User < ActiveRecord::Base
  has_many :past_lunches
  has_one :current_lunch
  has_secure_password

end
