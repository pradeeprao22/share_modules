class CreateCodeFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :code_files do |t|

      t.timestamps
    end
  end
end
