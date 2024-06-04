class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.text :content
      t.boolean :is_question
      t.integer :order

      t.timestamps
    end
  end
end
