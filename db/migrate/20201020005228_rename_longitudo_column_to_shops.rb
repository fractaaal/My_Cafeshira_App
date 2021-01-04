class RenameLongitudoColumnToShops < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :longitudo, :longitude
  end
end
