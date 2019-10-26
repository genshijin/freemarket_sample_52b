class ExhibitController < ApplicationController
  before_action :set_item
  before_action :ignore_rollback

  def show
    @item = Item.find(params[:id])
    @images = @item.image
    @seller = User.where('id = ?', @item.seller_id)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def logout_rollback
    redirect_to new_user_session_path unless user_signed_in?
  end

  def ignore_rollback
    redirect_to item_path(@item.id) if @item.seller_id != current_user.id
  end
end
