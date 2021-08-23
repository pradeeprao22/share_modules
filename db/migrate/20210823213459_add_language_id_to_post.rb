class AddLanguageIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :language_id, :integer
    add_index :posts, :language_id, unique: true
    
  end
end
