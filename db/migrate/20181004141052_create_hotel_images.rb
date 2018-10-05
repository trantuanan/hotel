class CreateHotelImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_images do |t|
      t.references :hotel, foreign_key: true

      t.string :image
    end
  end
end
