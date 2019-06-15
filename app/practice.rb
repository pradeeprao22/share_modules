class User < ApplicationRecord
  has_and_belongs_to_many :friends,
  class_name: "User",
  foreign_key: "this_user_id",
  association_foregin_key: "other_user_id"
end