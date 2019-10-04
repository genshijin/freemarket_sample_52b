class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  validates :nickname,               presence: true

  has_one :creditcard
  has_one :address
  accepts_nested_attributes_for :address
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # # step1
  # validates :nickname,               presence: true
  # validates :email,                  presence: true, unigueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :password,               presence: true, length: {minimum: 7, maximum: 128}, on: :save_to_session_before_phone
  # validates :password_confirmation,  presence: true, length: {minimum: 7, maximum: 128}, on: :save_to_session_before_phone
  # validates :first_name,             presence: true
  # validates :last_name,              presence: true
  # validates :first_name_kana,        presence: true
  # validates :last_name_kana,         presence: true
end
