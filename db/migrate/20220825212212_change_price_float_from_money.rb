class ChangePriceFloatFromMoney < ActiveRecord::Migration[7.0]
  def change
    add_monetize :wearables, :price, currency: {present: false}
  end
end
