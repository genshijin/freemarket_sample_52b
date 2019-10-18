class ItemsController < ApplicationController
  before_action :logout_rollback, except: [:index, :show]
  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def index
    @items= Item.order("id DESC").where.not(item_status: "stopping")
  end

  def show
    @images = @item.image
    @seller = User.where('id = ?', @item.seller_id)
  end

  def new
    @item = Item.new
    @price = params[:keyword]
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path,notice: '商品を出品しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "exhibit" and path[:action] == "show"
      if @item.stopping?
        redirect_to exhibit_path(@item),notice: '商品の一時停止をしました'
      elsif @item.exhibition?
        redirect_to exhibit_path(@item),notice: '商品の再開をしました'
      end
    else
      redirect_to exhibit_path(@item)
    end

  end

  def destroy
    if @item.destroy
      redirect_to exhibition_mypage_path, notice: '商品を削除しました'
    else
      redirect_to exhibit_path(@item), alert: '商品を削除できませんでした'
    end
  end


  private

  def item_params
    params.require(:item).permit(:name,
                                 :comment,
                                 :price,
                                 :state_id,
                                 :postage_burden_id,
                                 :shipping_date_id,
                                 :prefecture_id,
                                 :category_id,
                                 :shipping_way_id,
                                 :image,
                                 :item_status).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def logout_rollback
    redirect_to :root unless user_signed_in?
  end
end
