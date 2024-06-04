class Lesson < ApplicationRecord
  belongs_to :course
  has_many :steps, dependent: :destroy

  # Validations
  validates :title, presence: true, uniqueness: { scope: :course_id }
  validates :content, presence: true

  def to_param
    title
  end
end
