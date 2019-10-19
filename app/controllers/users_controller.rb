class UsersController < ApplicationController
  before_action :set_search

  def index
  end

  def edit
  end

  def logout
  end

  def exhibition
    @items=Item.where(seller:current_user[:id])
  end

  def trading
  end

  def completed
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
