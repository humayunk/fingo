class AddTitleToSteps < ActiveRecord::Migration[7.1]
  def change
    add_column :steps, :title, :string
  end
end
