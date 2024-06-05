class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, :course_id, presence: true
  validates :completed, inclusion: { in: [true, false] }

  validate :enrollment_date_is_valid_datetime

  private

  def enrollment_date_is_valid_datetime
    DateTime.parse(enrollment_date.to_s)
  rescue ArgumentError
    errors.add(:enrollment_date, 'must be a valid datetime')
  end
end
