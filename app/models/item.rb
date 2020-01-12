class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images
  has_many :likes
  has_many :reports
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_period
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :item_status
end
