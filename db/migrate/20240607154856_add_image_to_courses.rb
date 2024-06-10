class AddImageToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :image_name, :string
  end
end
