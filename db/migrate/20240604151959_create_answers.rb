class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.text :content
      t.boolean :is_correct

      t.timestamps
    end
  end
end
