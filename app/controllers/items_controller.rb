class ItemsController < ApplicationController

  def index
    @items= Item.order("id DESC")   
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @seller = User.where('id = ?', @item.seller_id)
  end
  def new
    @item = Item.new
    @item.images.build
  end

  def create
    itemf = Item.new(item_params)
    itemf.save
    redirect_to action: :index
  end

  def edit
  end


  private

  def item_params
    params.require(:item).permit(:name,:comment,:price,:state,:postage_burden,:shipping_date,:shipping_origin_area,:category_id,images_attributes: [:image]).merge(seller_id: 1)
  end

end
