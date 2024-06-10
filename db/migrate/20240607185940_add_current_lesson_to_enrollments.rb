class AddCurrentLessonToEnrollments < ActiveRecord::Migration[7.1]
  def change
    add_column :enrollments, :active_lesson, :integer, null: false, default: 1
  end
end
