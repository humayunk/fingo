class UpdateSteps < ActiveRecord::Migration[7.1]
  def change
    remove_column :steps, :is_question, :boolean
    add_column :steps, :category, :integer, null: false, default: 0
  end
end
