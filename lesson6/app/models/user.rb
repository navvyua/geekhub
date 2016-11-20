class User < ActiveRecord::Base
  after_create :create_profile

  has_secure_password

  has_many :posts
  has_one  :profile

  validates :email, presence: true
end
