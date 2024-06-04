class Step < ApplicationRecord
  belongs_to :lesson
  has_many :answers, dependent: :destroy

  # Validations
  validates :content, presence: true, length: { minimum: 5 }
  validates :is_questions, intrusion: { in: [true, false] }
  validates :lesson_id, presence: true, numericality: { only_integer: true }
  validates :order, presence: true, numericality: { only_integer: true }
end
