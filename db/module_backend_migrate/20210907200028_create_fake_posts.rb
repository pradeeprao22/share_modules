class CreateFakePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fake_posts do |t|
      t.string :content

      t.timestamps
    end
  end
end
