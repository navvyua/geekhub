class Post < ActiveRecord::Base
  belongs_to :user

  self.per_page = 10

  mount_uploader :image, ImageUploader
end
