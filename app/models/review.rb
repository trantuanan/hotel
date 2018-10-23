class Review < ApplicationRecord
  has_many :review_images
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes
  belongs_to :user
  belongs_to :motel
end
