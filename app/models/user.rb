class User < ActiveRecord::Base
  has_many :lunches

  has_secure_password

end
