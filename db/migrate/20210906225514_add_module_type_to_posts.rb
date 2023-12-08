class AddModuleTypeToPosts < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      # backend or frontend
      t.string :module_type
    end
  end
end
