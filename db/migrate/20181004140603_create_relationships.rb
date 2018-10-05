class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :hotel, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
