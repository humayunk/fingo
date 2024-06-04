class AddLessonidToStep < ActiveRecord::Migration[7.1]
  def change
    add_reference :steps, :lesson, null: false, foreign_key: true
  end
end
