class PurchaseController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @images = @item.images
  end

end
