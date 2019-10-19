class ExhibitController < ApplicationController
  before_action :set_search

  def show
    @item = Item.find(params[:id])
    @images = @item.image
    @seller = User.where('id = ?', @item.seller_id)
  end

  private

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
