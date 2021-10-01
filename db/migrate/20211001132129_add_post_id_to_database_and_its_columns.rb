class AddPostIdToDatabaseAndItsColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :database_and_its_columns, :post_id, :integer
  end
end
