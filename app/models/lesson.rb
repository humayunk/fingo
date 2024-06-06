class Lesson < ApplicationRecord
  has_many :steps
  belongs_to :course
  has_many :user_progresses do
    def active_for(user)
      where(user_id: user.id).where(completed: false).first
    end
  end

  # has_one :active_user_progress_for, ->(user) { where(user_id: user.id).where(completed: false) }, class_name: "UserProgress", foreign_key: :lesson_id

  # Validations
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 5 }
  validates :course_id, presence: true, numericality: { only_integer: true }

  def to_param
    title
  end
end
