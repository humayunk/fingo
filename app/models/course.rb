class Course < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }

  def to_param
    title
  end
end
