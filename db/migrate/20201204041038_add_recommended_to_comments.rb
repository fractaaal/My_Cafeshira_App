class AddRecommendedToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :recommended, :string
  end
end
