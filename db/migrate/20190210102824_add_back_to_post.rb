class AddBackToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :backend, :string
  end
end
