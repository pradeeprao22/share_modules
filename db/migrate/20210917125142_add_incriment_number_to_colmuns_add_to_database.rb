class AddIncrimentNumberToColmunsAddToDatabase < ActiveRecord::Migration[6.1]
  def change
    add_column :columns_for_fake_databases, :incriment_number, :integer
  end
end
