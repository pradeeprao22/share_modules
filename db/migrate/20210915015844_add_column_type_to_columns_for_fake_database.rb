class AddColumnTypeToColumnsForFakeDatabase < ActiveRecord::Migration[6.1]
  def change
    add_column :columns_for_fake_databases, :column_type, :string
  end
end
