class AddOrderToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :order, :integer, default: 0
  end
end
