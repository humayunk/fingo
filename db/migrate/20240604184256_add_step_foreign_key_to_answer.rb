class AddStepForeignKeyToAnswer < ActiveRecord::Migration[7.1]
  def change
    add_reference :answers, :step, null: false, foreign_key: true
  end
end
