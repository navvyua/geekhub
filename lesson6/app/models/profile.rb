class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  mount_uploader :avatar, AvatarUploader
end
