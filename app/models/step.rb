class Step < ApplicationRecord
  belongs_to :lesson
  has_many :answers, dependent: :destroy

  # Validations
  validates :content, presence: true, length: { minimum: 5 }
  validates :lesson_id, presence: true, numericality: { only_integer: true }
  validates :order, presence: true, numericality: { only_integer: true }
  validates :image_name, presence: true, if: -> { tutorial? }

  enum category: {
    unknown: 0,
    tutorial: 10,
    choice: 20,
    fill: 21
  }, _default: :unknown

  def question?
    Step.categories[category].digits.reverse.first == 2
  end

  def to_param
    order
  end
end
