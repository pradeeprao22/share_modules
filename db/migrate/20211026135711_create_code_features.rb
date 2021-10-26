class CreateCodeFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :code_features do |t|
      t.string :name
      t.string :importance
      t.string :currently_used

      t.timestamps
    end
  end
end
