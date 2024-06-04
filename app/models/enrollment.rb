class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, :course_id, presence: true
  validates :enrollment_date_is_valid_datetime
  validates :status, presence: true, inclusion: { in: %w(enrolled not-enrolled) }
end
