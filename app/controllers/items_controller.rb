class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :search

  def index
    @q = Item.ransack(params[:a])
    @search_items = @q.result(distinct: true)

    @items= Item.order("id DESC")   
  end

  def show
    @images = @item.image
    @seller = User.where('id = ?', @item.seller_id)
  end

  def new
    @item = Item.new
    @price = params[:keyword]
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def create
    itemf = Item.new(item_params)
    itemf.save
    redirect_to action: :index
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

  def search
    @q = Item.ransack(params[:a])
    @search_items = @q.result(distinct: true)
  end

  private

  def item_params
    params.require(:item).permit(:name,:comment,:price,:state_id,:postage_burden_id,:shipping_date_id,:prefecture_id,:category_id,:shipping_way_id,:image).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
