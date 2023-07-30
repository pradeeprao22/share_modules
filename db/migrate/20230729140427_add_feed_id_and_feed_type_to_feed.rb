class AddFeedIdAndFeedTypeToFeed < ActiveRecord::Migration[7.0]
  def change
    add_column :feeds, :feedable_id, :integer
    add_column :feeds, :feedable_type, :string
    remove_column :feeds, :post_id, :integer
  end
end
