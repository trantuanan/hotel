class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :level, default: 0
      t.text :description
      t.string :address
      t.string :phone

      t.timestamps
    end

    add_index :hotels, :address, unique: true
  end
end
