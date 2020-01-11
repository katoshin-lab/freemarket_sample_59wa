class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :user_address
  has_one :user_identification
  has_one :user_delivery
  has_many :user_payments
  has_many :likes
  has_many :reports
  has_many :items
  has_many :dealing_items
  has_many :bought_items

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }
  validates :mobile_phone_number, format: { with: /\A[0-9]{10}\z/ }
  validates :birthday, presence: true
  validates :profile, length: { maximum: 1000 }

end
