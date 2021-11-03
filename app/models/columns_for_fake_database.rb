class ColumnsForFakeDatabase < ApplicationRecord
    # this will be an array of columns
    belongs_to :database_table, class_name: 'DatabaseTable', foreign_key: 'database_table'
    has_many :data_types

    # def database_table
    #   self.database_table_id = self.database_table.id
    # end
end