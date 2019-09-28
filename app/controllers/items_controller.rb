class ItemsController < ApplicationController

  def index
    @items= Item.order("id DESC")
    # @items.each do |item|
    #   @images = item.images
      # @item = item
      # @item_id = item.id
      # @image = Image.find_by(item_id: @item_id)
    # end
   
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    # @seller_name = @item.users
    
  end
  
  

end
