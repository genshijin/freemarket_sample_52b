class UsersController < ApplicationController
  before_action :set_user, 

  def index
    @item=Item.where(buyer:current_user[:id])
  end

  def edit
  end

  def logout
  end

  def exhibition
    @items=Item.where(seller:current_user[:id],item_status:"exhibition")
               .or(Item.where(seller:current_user[:id],item_status:"stopping"))
  end

  def trading
    @items=Item.where(seller:current_user[:id],item_status:"trading")
  end

  def completed
    @items=Item.where(seller_id:current_user[:id],item_status:"completed")
  end

  private
  def set_user
    @user = User.find_by(id: current_user[:id])
  end

end
