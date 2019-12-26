class UserDelivery < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :postal_number, format: {with: /\A[0-9]{7}\z/}
  validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
end
