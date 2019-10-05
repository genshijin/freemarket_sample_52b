class ItemsController < ApplicationController

  def index
    @items= Item.order("id DESC")   
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @seller = User.where('id = ?', @item.seller_id)
  end

  def edit
  end

end
