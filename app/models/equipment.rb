class Equipment < ApplicationRecord
  has_many :hotel_equips
  has_many :hotels, through: :hotel_equips
end
