class CreateUserProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_progresses do |t|
      t.boolean :completed
      t.integer :score
      t.integer :current_step
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
