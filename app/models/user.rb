class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  reg_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  reg_only_kana = /\A[ァ-ヴ]+\z/
  reg_phone_number = /\A[0-9-]{,14}\z/
  reg_alphanumeric_7characters = /\A[a-zA-Z0-9]{7,128}+\z/

  # step1
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: reg_email }
  validates :password, presence: true, length: { minimum: 7, maximum: 128 }, format: { with: reg_alphanumeric_7characters, message: 'は英数字でパスワードを設定してください' }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: reg_only_kana, message: 'は全角で入力ください' }
  validates :last_name_kana, presence: true, format: { with: reg_only_kana, message: 'は全角で入力ください' }
  validates :birth_year, presence: { message: 'を選択してください'}
  validates :birth_month, presence: { message: 'を選択してください'}
  validates :birth_day, presence: { message: 'を選択してください'}
  #step2
  validates :phone_number, presence: true, format: { with: reg_phone_number }

  has_one :creditcard
  has_one :address
  accepts_nested_attributes_for :address
  validates_associated :address
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
end
