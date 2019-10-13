class UsersController < ApplicationController
  def index
    @item=Item.where(buyer:current_user[:id])
  end

  def edit
  end

  def logout
  end

  def exhibition
    @items=Item.where(seller:current_user[:id],item_status:0)
  end

  def trading
    @items=Item.where(seller:current_user[:id],item_status:1)
  end

  def completed
    @items=Item.where(seller_id:current_user[:id],item_status:2)
  end
end
