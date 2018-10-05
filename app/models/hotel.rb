class Hotel < ApplicationRecord
  has_many :hotel_images
  has_many :hotel_rooms
  has_many :rooms, through: :hotel_rooms
  has_many :hotel_equips
  has_many :equipments, through: :hotel_equips
  has_many :relationships
  has_many :reviews
end
