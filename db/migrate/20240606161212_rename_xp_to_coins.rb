class RenameXpToCoins < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :xp, :coins
  end
end
