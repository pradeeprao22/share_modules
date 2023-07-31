class AddFeedIdAndFeedTypeToFeed < ActiveRecord::Migration[7.0]
  def change
    add_column :feeds, :feedable_id, :integer
    add_column :feeds, :feedable_type, :string
  end
end
