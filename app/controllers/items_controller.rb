class ItemsController < ApplicationController

  def index
    @items= Item.order("id DESC")   
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    # @seller_name = @item.users
    
  end

  def edit
  end

end
