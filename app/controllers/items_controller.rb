class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_back(fallback_location:  exhibit_path)
  end

  private
  def items_params
    params.permit(:name, :comment,:price,:state,:postage_burden,:shipping_date,:shipping_origin_area)
  end

  private

  def item_params
    params.require(:item).permit(:name,:comment,:price,:state,:postage_burden,:shipping_date,:shipping_origin_area,:category_id,images_attributes: [:image]).merge(seller_id: 1)
  end

end
