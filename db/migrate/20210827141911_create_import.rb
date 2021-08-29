class CreateImport < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.string :import_client
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :desctiption

      t.timestamps
    end
  end
end
