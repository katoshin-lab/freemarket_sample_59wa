class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, foreign_key: "seller_id"
  has_many :items, foreign_key: "buyer_id"
  has_many :likes

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
end
