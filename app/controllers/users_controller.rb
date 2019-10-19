class UsersController < ApplicationController
  before_action :set_search
  before_action :logout_rollback

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

  def logout_rollback
    redirect_to new_user_session_path unless user_signed_in?
  end

  # def search
  #   @q = Item.ransack(params[:a])
  #   @search_items = @q.result(distinct: true)
  # end

  private

  def set_search
    @q = Item.search(params[:q])
  end

end
