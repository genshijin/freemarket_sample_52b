class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3

  def index
    session.clear
  end

  def step1
    @user = User.new
  end

  def validates_step1
    #setp1 入力項目
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    #メールからの場合、パスワードは入力項目から取得する
    unless session[:sns_id].present?
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
    end
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: "000-0000-0000"
    )
    # sns認証からの場合とメールからの場合でエラー時の表示先の分岐
    if session[:sns_id].present?
      render '/signup/step1-sns' unless @user.valid?
    else
      render '/signup/step1' unless @user.valid?
    end
  end

  def step2
    @user = User.new
  end

  def validates_step2
    #setp2 入力項目
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number]
    )
    render '/signup/step2' unless @user.valid?
  end

  def step3
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number]
    )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      # sns認証からの場合sns_credentialテーブルにユーザーIDの保存
      if session[:sns_id].present?
        SnsCredential.update(user_id: @user.id)
      end
      # セッション情報の一時削除
      session.clear
      # ログイン用のセッションID取得
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step3'
    end
  end

  def done
    #取得したセッションIDからサインインする
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number,
      address_attributes: [
        :id,
        :first_name,
        :last_name,
        :first_name_kana,
        :last_name_kana,
        :postal_code,
        :prefecture_id,
        :city,
        :address,
        :building_name,
        :phone_number
      ]
    )
  end
end
