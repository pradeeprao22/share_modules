class RenameModuleTypeToUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :database_tables, :module_type_id, :user_id
  end
end
