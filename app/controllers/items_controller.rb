class ItemsController < ApplicationController
  def index
  end

  def show
  end
  def new
    @item = Item.new
    @price = params[:keyword]
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
    params.require(:item).permit(:name,:comment,:price,:state_id,:postage_burden_id,:shipping_date_id,:shipping_origin_area_id,:category_id,:image).merge(seller_id: current_user.id)
  end

end
