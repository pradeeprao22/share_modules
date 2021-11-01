class AddTypeToDataType < ActiveRecord::Migration[6.1]
  def change
    add_column :data_types, :type_name, :string
    add_column :data_types, :columns_id, :integer
  end
end
