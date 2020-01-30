class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  validates :uid, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :provider, presence: true
  validates :user_id, numericality: { only_integer: true }, allow_blank: true, on: :update
  validates :name, presence: true
  validates :email,presence: true
  validates :token, presence: true
end
