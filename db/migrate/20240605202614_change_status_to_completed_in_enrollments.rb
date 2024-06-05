class ChangeStatusToCompletedInEnrollments < ActiveRecord::Migration[7.1]
  def change
    remove_column(:enrollments, :status)
    add_column(:enrollments, :completed, :boolean, null: false, default: false)
  end
end
