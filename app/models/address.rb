class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  reg_only_kana = /\A[ァ-ヴ]+\z/
  reg_postal_code = /\A[0-9]{3}\-[0-9]{4}+\z/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: reg_only_kana, message: 'は全角カタカナで入力ください' }
  validates :last_name_kana, presence: true, format: { with: reg_only_kana, message: 'は全角カタカナで入力ください' }
  validates :postal_code, presence: true, format: { with: reg_postal_code, message: '3桁-(ハイフン)4桁の数字で入力ください'}
  validates :prefecture_id, presence: { message: 'を選択してください'}
  validates :city, presence: true
  validates :address, presence: true
end
