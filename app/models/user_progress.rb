class UserProgress < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_one :course, through: :lesson
  has_one :enrollment, through: :course

  scope :for, ->(user) { find_by(user: user, active: true) }

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :lesson_id, presence: true, numericality: { only_integer: true }
  validates :completed, inclusion: { in: [true, false] }
  validates :score, presence: true, numericality: { only_integer: true }
  validates :current_step, presence: true, numericality: { only_integer: true }
end
