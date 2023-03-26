class AddFieldsToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :bio, :string
    add_column :members, :url, :string
  end
end
