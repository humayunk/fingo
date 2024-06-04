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
end
