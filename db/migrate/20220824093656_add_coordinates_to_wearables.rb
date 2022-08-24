class AddCoordinatesToWearables < ActiveRecord::Migration[7.0]
  def change
    add_column :wearables, :latitude, :float
    add_column :wearables, :longitude, :float
  end
end
