class RenameNameColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :name, :title
  end
end
