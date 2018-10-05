class User < ApplicationRecord
  has_many :relationships
  has_many :comments
  has_many :reviews
  has_many :replies
  has_many :likes
end
