class DropTableShops < ActiveRecord::Migration[6.0]
  def change
    drop_table :shops
  end
end
