class Lesson < ApplicationRecord
  belongs_to :course
  has_many :steps, dependent: :destroy

  # Validations
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 5 }
  validates :course_id, presence: true, numericality: { only_integer: true }

  def to_param
    title
  end
end
