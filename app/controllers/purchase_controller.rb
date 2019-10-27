class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_item
  before_action :set_card, except: [:done, :sold]
  before_action :set_address, except: [:pay, :sold]
  before_action :get_payjp_info, only: [:index, :pay]
  before_action :seller_back, only: [:index, :pay]
  before_action :sold_back, except: [:sold, :done]

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

  def pay
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )
    if @item.update(buyer_id: current_user.id,item_status: :completed)
      redirect_to action: "done"
    else
      flash[:alert] = '購入に失敗しました。'
      redirect_to item_path(@item.id)
    end
  end

  def done
  end

  def sold
  end

  private
  def logout_rollback
    redirect_to new_user_session_path unless user_signed_in?
  end

  # 商品のセッター
  def set_item
    @item = Item.find(params[:item_id])
  end

  # 発送先情報のセッター
  def set_address
    @buyer_address = Address.where('id = ?', current_user.id)
  end

  # クレジットカード関連の処理
  def set_card
    @card = current_user.creditcard if current_user.creditcard.present?
  end

  # 環境ごとのpayjpの秘密鍵取得
  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    else
      Payjp.api_key = Rails.application.secrets.payjp_private_key
    end
  end

  # 出品者がアクセスした場合、商品ページに戻る
  def seller_back
    redirect_to item_path(@item.id) if @item.seller_id == current_user.id
  end

  # 購入者がいる場合、売り切れのビューへ飛ぶ
  def sold_back
    redirect_to action: "sold" if @item.buyer_id != nil
  end
end

