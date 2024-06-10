class AddImageToSteps < ActiveRecord::Migration[7.1]
  def change
    add_column :steps, :image_name, :string
  end
end
