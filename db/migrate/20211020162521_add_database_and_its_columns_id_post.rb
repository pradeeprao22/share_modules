class AddDatabaseAndItsColumnsIdPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :database_and_column_id, :integer
  end
end
