class CreateImageRepo < ActiveRecord::Migration[6.1]
  def change
    create_table :image_repos do |t|
      t.string :image_name
      t.integer :post_id

      t.timestamps
    end
  end
end
