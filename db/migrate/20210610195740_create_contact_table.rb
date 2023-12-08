class CreateContactTable < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_tables do |t|
      t.string :name
      t.string :number
      t.string :phonenumber
      t.string :message

      t.timestamps
    end
  end
end
