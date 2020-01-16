class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images, inverse_of: :item
  accepts_nested_attributes_for :images
  has_many :likes
  has_many :reports
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :subcategory, optional: true
  belongs_to :sub_subcategory, optional: true
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_period
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :item_status

  
  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :seller, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :is_seller_shipping, inclusion: { in: [true, false] }
  validates :prefecture_id, presence: true
  validates :shipping_period_id, presence: true
  validates :shipping_method_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: {in: 300..9999999 }
  validates :item_status_id, presence: true

end
