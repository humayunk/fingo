if @success
  json.status "success"
  json.card render(partial: "items/card", formats: :html, locals: { item: @item, is_purchased: true })
  json.new_coins_balance current_user.coins
  json.new_avatar @new_avatar if @new_avatar
else
  json.status "failure"
  json.message "not enough coins"
end
