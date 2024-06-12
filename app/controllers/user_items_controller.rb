class UserItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if current_user.coins >= @item.price
      new_balance = current_user.coins - @item.price
      current_user.update(coins: new_balance)
      UserItem.create(user: current_user, item: @item, price: @item.price)
      render json: { status: "success" }
    else
      render json: { status: "failure", message: "not enough coins" }
    end
  end
end
