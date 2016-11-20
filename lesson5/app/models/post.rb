class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :comments, as: :commentable

  self.per_page = 10

  mount_uploader :image, ImageUploader
end
