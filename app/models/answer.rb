class Answer < ApplicationRecord
  belongs_to :step

  validates :step_id, presence: true, numericality: { only_integer: true }
  validates :content, presence: true
  validates :is_correct, presence: true, inclusion: { in: [true, false] }
end
