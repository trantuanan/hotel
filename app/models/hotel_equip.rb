class HotelEquip < ApplicationRecord
  belongs_to :hotel
  belongs_to :equipment
end
