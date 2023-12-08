class AddPostAndUserToColumnsForFakeDatabase < ActiveRecord::Migration[6.1]
  def change
    add_column :columns_for_fake_databases, :user_id, :integer
    add_index :columns_for_fake_databases, :user_id
    add_column :columns_for_fake_databases, :post_id, :integer
    add_index :columns_for_fake_databases, :post_id
  end
end
