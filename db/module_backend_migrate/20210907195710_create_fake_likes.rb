class CreateFakeLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :fake_likes do |t|
      t.string :user

      t.timestamps
    end
  end
end
