class UsersController < ApplicationController
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
end
