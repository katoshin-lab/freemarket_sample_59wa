class UserPayment < ApplicationRecord
  belongs_to :user

  validates :customer_id, presence: true, format: { with: /\Acus_\h+/ }
  validates :card_id, presence: true, format: { with: /\Acar_\h+/ }
end
