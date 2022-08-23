class AddSizeToWearables < ActiveRecord::Migration[7.0]
  def change
    add_column :wearables, :size, :string
  end
end
