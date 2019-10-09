class PurchaseController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = Address.where('id = ?', current_user.id)
  end

end

