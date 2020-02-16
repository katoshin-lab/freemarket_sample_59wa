class UserDelivery < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :user_id, presence: true
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :first_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :postal_number, presence: true, format: { with: /\A[0-9]{7}\z/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true, length: { maximum: 25 }
  validates :block, presence: true, length: { maximum: 25 }
  validates :building_name, length: { maximum: 25 }, allow_blank: true
  validates :phone_number, format: { with: /\A[0-9]{9,10}\z/ }, allow_blank: true
end
