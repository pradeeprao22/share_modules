class AddTagsIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tags_id, :text, array: true, default: []
  end
end
