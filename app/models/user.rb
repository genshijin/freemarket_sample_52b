class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  REG_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # step1
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: REG_EMAIL }
  validates :password, presence: true, length: {minimum: 7, maximum: 128, message: 'は7文字以上128文字以下で入力してください'}
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  #step2
  validates :phone_number, presence: true, format: { with: /\A[0-9-]{,14}\z/ }

  has_one :creditcard
  has_one :address
  accepts_nested_attributes_for :address
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
end
