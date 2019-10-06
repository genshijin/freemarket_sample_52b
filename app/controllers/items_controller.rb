class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
  end
  def new
    @item = Item.new
    @price = params[:keyword]
    # respond_to do |format|
    #   format.html
    #   format.json
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
    @item.update(item_params)
    redirect_to controller: :exhibit, action: :show
  end

  private

  def item_params
    params.require(:item).permit(:name,:comment,:price,:postage_burden,:shipping_date,:prefecture,:category,:shipping_way,:image,).merge(seller_id: current_user.id)
  end

end
