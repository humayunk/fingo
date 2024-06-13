class AddDefaultValuesToCoinsAndStreak < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :coins, 0
    change_column_default :users, :streak, 0
  end
end
