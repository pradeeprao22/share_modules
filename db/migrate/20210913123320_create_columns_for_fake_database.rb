class CreateColumnsForFakeDatabase < ActiveRecord::Migration[6.1]
  def change
    create_table :columns_for_fake_databases do |t|
      t.string :name
      t.string :tag
      t.text :database_table_id, array: true, default: []

      t.timestamps
    end
  end
end

# array: true, default: []
