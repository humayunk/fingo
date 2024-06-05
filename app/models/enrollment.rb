class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, :course_id, presence: true
  validates :status, presence: true, inclusion: { in: %w(enrolled not-enrolled) }

  validate :enrollment_date_is_valid_datetime

  private

  def enrollment_date_is_valid_datetime
    errors.add(:enrollment_date, 'must be a valid datetime') if enrollment_date.present? && !enrollment_date.is_a?(DateTime)
  end
end
