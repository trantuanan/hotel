class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rate, default: 0

      t.references :hotel, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
