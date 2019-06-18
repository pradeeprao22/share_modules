class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
