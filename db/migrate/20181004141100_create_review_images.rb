class CreateReviewImages < ActiveRecord::Migration[5.2]
  def change
    create_table :review_images do |t|
      t.references :review, foreign_key: true

      t.string :image
    end
  end
end
