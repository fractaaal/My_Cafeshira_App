class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :account_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
