class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.string :login_counts
      t.integer :lan
      t.integer :lon
      t.integer :user_id

      t.timestamps
    end
  end
end
