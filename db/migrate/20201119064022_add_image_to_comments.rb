class AddImageToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :image, :string
    add_column :comments, :bitterness, :integer
    add_column :comments, :acidity, :integer
    add_column :comments, :fragrance, :integer
    add_column :comments, :rich, :integer
    add_column :comments, :sweetnessa, :integer
  end
end
