class AddUserTypeToCodeFeature < ActiveRecord::Migration[6.1]
  def change
    add_column :code_features, :user_type, :string
  end
end
