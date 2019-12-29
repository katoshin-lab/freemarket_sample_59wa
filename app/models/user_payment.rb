class UserPayment < ApplicationRecord
  belongs_to :user

  validates :customer_id, presence: true, format: { with: /^cus/ }
  validates :card_id, presence: true, format: { with: /^car/ }
end
