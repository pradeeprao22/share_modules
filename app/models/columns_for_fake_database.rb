class ColumnsForFakeDatabase < ApplicationRecord
    # this will be an array of columns
    belongs_to :database_table, class_name: 'DatabaseTable', foreign_key: 'database_table'
end