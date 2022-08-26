class AddStripeIdToWearables < ActiveRecord::Migration[7.0]
  def change
    add_column :wearables, :stripe_id, :string
  end
end
