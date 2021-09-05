class CreateDatabaseTables < ActiveRecord::Migration[6.1]
  def change
    create_table :database_tables do |t|
      t.string :databasename
      t.string :databasetable

      t.timestamps
    end
  end
end
