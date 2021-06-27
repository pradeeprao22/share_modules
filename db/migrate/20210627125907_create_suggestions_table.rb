class CreateSuggestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions_tables do |t|
      t.string :name
      t.timestamps
    end
  end
end
