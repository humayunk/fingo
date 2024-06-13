class AddPictureNameToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :picture_name, :string
  end
end
