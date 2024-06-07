class Course < ApplicationRecord
  has_many :enrollments
  has_many :lessons
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :image_name, presence: true

  def to_param
    title
  end

  # for use on home/dashboard page for recommended courses
  # in dashboard controller Course.user_not_enrolled(current_user).take(3) (for 3 recommended courses)
  scope :user_not_enrolled, lambda { |user|
    where.not(id: Course.joins(:enrollments).where(enrollments: { user_id: user.id }).pluck(:id))
  }
end
