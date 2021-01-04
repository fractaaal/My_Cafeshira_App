class AddMapInfoToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :latitude, :float
    add_column :shops, :longitudo, :float
  end
end
