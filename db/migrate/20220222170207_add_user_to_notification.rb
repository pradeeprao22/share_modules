class AddUserToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :user_id, :integer
  end
end
