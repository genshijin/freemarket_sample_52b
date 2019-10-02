class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def logout
  end

  def exhibition
    @items=Item.all
  end

  def trading
  end

  def completed
  end
end
