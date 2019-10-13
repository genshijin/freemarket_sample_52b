class CreditcardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :get_payjp_info, only: [:index, :new, :create, :destroy]

  def index
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      # 登録しているカード会社のブランドアイコンを表示するためのコード ---------
      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
        @logo_size = "49x20"
      when "JCB"
        @card_src = "jcb.svg"
        @logo_size = "32x20"
      when "MasterCard"
        @card_src = "master-card.svg"
        @logo_size = "34x20"
      when "American Express"
        @card_src = "american_express.svg"
        @logo_size = "21x20"
      when "Diners Club"
        @card_src = "dinersclub.svg"
        @logo_size = "32x20"
      when "Discover"
        @card_src = "discover.svg"
        @logo_size = "32x20"
      end
      # ---------------------------------------------------------------
    end
  end

  def new
    redirect_to action: "index" if @card.present?
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: "index", notice: "削除しました"
    else
      flash.now[:alert] = "削除できませんでした"
      render action: "index"
    end
  end

  private

  def set_card
    @card = current_user.creditcard if current_user.creditcard.present?
  end

  def get_payjp_info
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
  end
end
