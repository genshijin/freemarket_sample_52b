class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_one :creditcard, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :sns_credentials, dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  reg_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  reg_only_kana = /\A[ァ-ヴ]+\z/
  reg_phone_number = /\A[0-9-]{,14}\z/
  reg_alphanumeric_7characters = /\A[a-zA-Z0-9]+\z/

  # step1
  validates :nickname, presence: true
  validates :email, uniqueness: true, format: { with: reg_email }
  validates :password, format: { with: reg_alphanumeric_7characters, message: '英数字で設定してください' }, length: { minimum: 7, maximum: 128 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: reg_only_kana, message: 'は全角カタカナで入力ください' }
  validates :last_name_kana, presence: true, format: { with: reg_only_kana, message: 'は全角カタカナで入力ください' }
  validates :birth_year, presence: { message: 'を選択してください'}
  validates :birth_month, presence: { message: 'を選択してください'}
  validates :birth_day, presence: { message: 'を選択してください'}
  #step2
  validates :phone_number, presence: true, format: { with: reg_phone_number }

  #sns認証周りの動作
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)

    #SNS認証済みの分岐
    if snscredential.present?
      # ユーザーidとSNS認証のuser_idが紐付いているか
      user = User.find_by(id: snscredential.user_id)
      unless user.present?
        # 紐付いていない時、メアドが一致するか確認
        user = User.find_by(email: auth.info.email)
        if user.present?
          # メアドが一致する時 snsカラムの更新
          SnsCredential.update(user_id: user.id)
        else
          # メアドが一致しない時 ユーザー情報の作成
          user = User.new(
            nickname: auth.info.name,
            email: auth.info.email,
            password: Devise.friendly_token.first(8)
          )
        end
      end
      # 作成済みSNS認証の保持
      sns = snscredential

    #SNS未登録の分岐
    else
      # ユーザー登録済みか
      user = User.find_by(email: auth.info.email)
      if user.present?
        # 登録済みユーザーの場合 SNS認証カラムの作成・保存
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else
        # 未登録ユーザーの場合 ユーザーインスタンス作成
        user = User.new(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token.first(8)
        )
        # 未登録ユーザーの場合 SNS認証インスタンス作成・DB保存
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    # user情報と作成したsns認証カラムのidを返す
    return { user: user, sns_id: sns.id }
  end

end

