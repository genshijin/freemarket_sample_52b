class ItemsController < ApplicationController
  def index
  end

  def show
  end
  def new
    @item = Item.new
    @item.images.build
  end

  def create
  end

  def edit
  end
end
