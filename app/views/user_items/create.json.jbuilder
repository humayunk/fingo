if @success
  json.status "success"
  json.card render(partial: "items/card", formats: :html, locals: { item: @item, is_purchased: true })
else
  json.status "failure"
  json.message "not enough coins"
end
