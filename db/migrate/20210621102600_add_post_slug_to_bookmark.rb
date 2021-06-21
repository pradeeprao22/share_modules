class AddPostSlugToBookmark < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :post_slug, :string
  end
end
