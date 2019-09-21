class ItemsController < ApplicationController
  def index
    @item = ITEM.all
  end

  def show
  end
end
