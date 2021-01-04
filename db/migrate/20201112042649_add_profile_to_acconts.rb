class AddProfileToAcconts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :profile, :text
  end
end
