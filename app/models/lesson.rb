class Lesson < ApplicationRecord
  def to_param
    title
  end
end
