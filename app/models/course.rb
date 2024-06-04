class Course < ApplicationRecord
  def to_param
    title
  end
end
