class AddOrderRankToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :order_rank, :integer
  end
end
