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
end
