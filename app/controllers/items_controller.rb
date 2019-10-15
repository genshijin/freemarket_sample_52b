class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def index
    @items= Item.order("id DESC")   
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
    redirect_to controller: :exhibit, action: :show
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
    params.require(:item).permit(:name,:comment,:price,:state_id,:postage_burden_id,:shipping_date_id,:prefecture_id,:category_id,:shipping_way_id,:image).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
