class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :xp, presence: true, numericality: { only_integer: true }
  validates :streak, presence: true, numericality: { only_integer: true }

  has_many :user_progresses
  has_many :enrollments
  has_one :active_enrollment, -> { where completed: false}, class_name: 'Enrollment', foreign_key: :user_id
  has_one :active_course, through: :active_enrollment, class_name: "Course", source: :course


  # if in future, can enroll in multiple courses can change to has_many: active_enrollments
end
