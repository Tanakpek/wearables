class AddAddressToWearables < ActiveRecord::Migration[7.0]
  def change
    add_column :wearables, :address, :string
  end
end
