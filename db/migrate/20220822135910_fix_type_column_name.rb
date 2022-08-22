class FixTypeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :wearables, :type, :category
  end
end
