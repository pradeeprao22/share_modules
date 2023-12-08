class CreateNotification < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :name
      t.references :notificationable, polymorphic: true
      t.timestamps
    end
  end
end
