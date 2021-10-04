class AddUserToDatabaseAndItsColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :database_and_its_columns, :user_id, :integer
  end
end
