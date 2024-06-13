class ItemsController < ApplicationController
  def index
    @items = Item.all
    @user_purchased_items = current_user.items
  end
end
