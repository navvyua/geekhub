class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_one  :profile
end
