class CreateDataType < ActiveRecord::Migration[6.1]
  def change
    create_table :data_types do |t|
      t.string :name
      t.string :selected_column

      t.timestamps
    end
  end
end
