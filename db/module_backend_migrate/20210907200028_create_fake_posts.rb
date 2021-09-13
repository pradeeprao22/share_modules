class CreateFakePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fake_posts do |t|
      t.string :description

      t.timestamps
    end
  end
end
