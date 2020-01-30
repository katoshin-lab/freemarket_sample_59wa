class SnsCredential < ApplicationRecord
  belongs_to :user

  validate :uid, presence: true, unipueness: true, numericality: { only_integer: true }
  validate :provider, presence: true
  validate :user_id, numericality: { only_integer: true }, allow_blank: true
  validate :name, presence: true
  validate :email,presence: true
  validate :token, presence: true
end
