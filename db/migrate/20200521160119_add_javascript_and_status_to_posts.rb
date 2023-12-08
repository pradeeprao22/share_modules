class AddJavascriptAndStatusToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :javascript, :text
    add_column :posts, :status, :integer
  end
end
