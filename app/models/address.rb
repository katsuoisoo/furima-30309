class Address < ApplicationRecord

  belongs_to :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
