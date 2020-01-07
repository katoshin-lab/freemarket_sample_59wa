class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :images
  has_many :likes
  has_many :reports
  belongs_to :brand
  belongs_to :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_period
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :item_status
end
