class AddCategoryToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :category, :integer
  end
end
