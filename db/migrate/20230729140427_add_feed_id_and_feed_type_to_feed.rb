class AddFeedIdAndFeedTypeToFeed < ActiveRecord::Migration[7.0]
  def change
    add_column :feeds, :feed_id, :integer
    add_column :feeds, :feed_type, :string
  end
end
