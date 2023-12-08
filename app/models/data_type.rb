class DataType < ApplicationRecord
  belongs_to :columns_for_fake_database, class_name: 'ColumnsForFakeDatabase', foreign_key: 'columns_id'
end
