class Dealing < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dealing_status
  belongs_to_active_hash :prefecture

  validates :buyer_id, presence: true
  validates :item_id, presence: true
  validates :charge, presence: true
  validates :dealing_status_id, presence: true
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }
  validates :postal_number, presence: true, format: { with: /\A[0-9]{7}\z/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true, length: { maximum: 25 }
  validates :block, presence: true, length: { maximum: 25 }
  validates :building_name, length: { maximum: 25 }, allow_blank: true
  validates :phone_number, format: { with: /\A[0-9]{9,10}\z/ }, allow_blank: true
end
