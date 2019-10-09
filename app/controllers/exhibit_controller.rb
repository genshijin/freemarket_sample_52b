class ExhibitController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @images = @item.image
    @seller = User.where('id = ?', @item.seller_id)
  end
end
