class ItemsController < ApplicationController
  def index
  end

  def show
  end
  def new
    @item = Item.new
    respond_to do |format|
      format.html
      format.json
    end
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
    params.require(:item).permit(:name,:comment,:price,:state,:postage_burden,:shipping_date,:shipping_origin_area,:category_id,:image).merge(seller_id: 1)
  end

end
