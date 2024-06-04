class Answer < ApplicationRecord
  belongs_to :step

  validates :step_id, :content, :is_correct, presence: true
end
