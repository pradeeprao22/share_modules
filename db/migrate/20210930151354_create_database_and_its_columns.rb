class CreateDatabaseAndItsColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :database_and_its_columns do |t|
      t.integer :columns_for_fake_database_id
      t.integer :database_table_id

      t.timestamps
    end
  end
end
