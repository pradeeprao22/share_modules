class AddDatabaseToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :database_id, :integer
    add_column :posts, :database_type, :integer
  end
end
