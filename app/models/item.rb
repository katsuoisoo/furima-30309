class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  with_options  numericality: { other_than: 1, message: 'Select'} do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :area_id
    validates :day_id
  end

  validates :price, numericality: { greater_than: 300,less_than: 10000000, message: 'Out of setting range'}
  validates :price, numericality: { only_integer: true, message: 'Half-width characters' }

  has_one :user_item
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :area
  belongs_to :day
  
end
