class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.text :description
      t.string :recommended
      t.integer :bitterness
      t.integer :acidity
      t.integer :fragrance
      t.integer :rich
      t.integer :sweetness
      t.integer :prefecture_id
      t.string :city
      t.integer :account_id
      t.time :open_at
      t.time :close_at
      t.string :station
      t.integer :holiday_id
      t.string :phone_number

      t.timestamps
    end
  end
end
