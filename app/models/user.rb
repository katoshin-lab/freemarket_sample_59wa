class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one :user_address, dependent: :destroy
  has_one :user_delivery, dependent: :destroy
  has_one :sns_credential, dependent: :destroy
  has_many :user_payments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports
  has_many :dealing_items
  has_many :bought_items
  has_many :sell_items, class_name: "Item", foreign_key: "seller_id"
  has_many :buy_items, class_name: "Item", foreign_key: "buyer_id"

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :first_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :mobile_phone_number, format: { with: /\A[0-9]{10}\z/ }
  validates :birthday, presence: true
  validates :profile, length: { maximum: 1000 }

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

  def self.from_omniauth(auth)
    sns_credential = SnsCredential.where(provider: auth.provider, uid: auth.uid).first
    user = User.where(id: sns_credential.user_id).first
    if user
      return user
    else
      return false
    end
  end

  def self.validation?(params)
    year = params["birthday(1i)"]
    month = params["birthday(2i)"]
    day = params["birthday(3i)"]
    birthday = "#{year}-#{month}-#{day}"
    user_params = {name: params[:name], email: params[:email], password: params[:password], last_name: params[:last_name], last_name_kana: params[:last_name_kana], first_name: params[:first_name], first_name_kana: params[:first_name_kana], birthday: birthday}
    user = User.new(user_params)
    return user.valid?
  end
end
