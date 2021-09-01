class AppBuilder < ActiveRecord::Migration[6.1]
  def change
    create_table :app_builders do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
