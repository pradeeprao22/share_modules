class AddModuleTypeToDatabsesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :database_tables, :module_type_id, :integer
    add_index :database_tables, :module_type_id, unique: false
  end
end
