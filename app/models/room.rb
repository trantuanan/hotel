class Room < ApplicationRecord
  has_many :hotel_rooms
  has_many :motels, through: :hotel_rooms

  validates :room_type, presence: true,
    uniqueness: {case_sensitive: false}
  validates :bed_numbers, presence: true
  validates :guest_no, presence: true
  before_save :beatify

  private

  def beatify
    self.room_type = room_type.titleize
  end
end
