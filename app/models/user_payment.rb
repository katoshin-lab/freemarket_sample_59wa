class UserPayment < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :customer_id, presence: true, format: { with: /\Acus_[0-9a-f]+\z/ }
  validates :card_id, presence: true, format: { with: /\Acar_[0-9a-f]+\z/ }
end
