class AddMemberIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :member_id, :integer
    add_column :likes, :member_id, :integer
    add_column :comments, :member_id, :integer
    add_column :bookmarks, :member_id, :integer
  end
end
