class AddDatabaseToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :database, :integer
    add_column :posts, :database_type, :integer
  end
end
