class AddPageToVisitornewDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :visitornew_details, :page, :string
  end
end
