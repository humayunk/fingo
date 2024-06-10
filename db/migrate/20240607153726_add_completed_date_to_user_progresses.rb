class AddCompletedDateToUserProgresses < ActiveRecord::Migration[7.1]
  def change
    add_column :user_progresses, :completed_date, :date
  end
end
