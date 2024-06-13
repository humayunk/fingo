class UserItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if current_user.coins >= @item.price
      new_balance = current_user.coins - @item.price
      current_user.update(coins: new_balance)
      UserItem.create(user: current_user, item: @item, price: @item.price)
      if @item.avatar?
        current_user.update(avatar: @item.picture_name)
        @new_avatar = view_context.image_url(@item.picture_name)
      end
      @success = true

      respond_to do |format|
        format.html { redirect_to :store_path }
        format.json
      end
      # render json: {
      #   status: "success",
      #   card: render(partial: "items/card", formats: :html, locals: { item: @item, is_purchased: true })
      # }
    else
      @success = false

      respond_to do |format|
        format.html { render "items/index", status: :unprocessable_entity }
        format.json
      end
    end
  end
end
