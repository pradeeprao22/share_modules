class RemoveDatabaseTableIdFromColumnsForFakeDatabase < ActiveRecord::Migration[6.1]
  def change
    remove_column :columns_for_fake_databases, :database_table_id, :integer
  end
end
