class CreateFakeContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :fake_contacts do |t|
      t.string :email

      t.timestamps
    end
  end
end
