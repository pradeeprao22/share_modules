class CreateCodeFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :code_files do |t|
      t.string :name
      t.integer :size
      t.string :file_type
      t.string :post_column
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
