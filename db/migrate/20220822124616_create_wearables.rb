class CreateWearables < ActiveRecord::Migration[7.0]
  def change
    create_table :wearables do |t|
      t.string :brand
      t.string :type
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.string :title
      t.boolean :available

      t.timestamps
    end
  end
end
