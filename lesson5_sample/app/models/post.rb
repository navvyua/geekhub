class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  self.per_page = 5
end
