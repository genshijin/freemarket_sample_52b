class UsersController < ApplicationController
  before_action :search

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

  def search
    @q = Item.ransack(params[:a])
    @search_items = @q.result(distinct: true)
  end
end
