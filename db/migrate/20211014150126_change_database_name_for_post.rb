class ChangeDatabaseNameForPost < ActiveRecord::Migration[6.1]
  def change
    #rename_column :posts, :database_id, :database
  end
end
