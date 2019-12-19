class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :user_address
  has_one :user_real_name
  has_one :user_delivery
  has_many :user_payments
  has_many :likes
  has_many :reports
  has_many :items
  has_many :dealing_items
  has_many :bought_items
end
