class UserDelivery < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }
  validates :postal_number, presence: true, format: { with: /\A[0-9]{7}\z/ }
  validates :city, presence: true, length: { maximum: 25 }
  validates :block, presence: true, length: { maximum: 25 }
  validates :building_name, length: { maximum: 25 }
  validates :phone_number, presence: true, format: { with: /\A[0-9]{9,10}\z/ }
end
