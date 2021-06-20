class AddPostSlugToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :post_slug, :string
  end
end
