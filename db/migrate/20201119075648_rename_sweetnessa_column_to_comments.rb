class RenameSweetnessaColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :sweetnessa, :sweetness   
  end
end
