class AddNotifyMessageToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :notify_message, :string
  end
end
