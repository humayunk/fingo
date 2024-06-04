class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.date :enrollment_date
      t.boolean :status

      t.timestamps
    end
  end
end
