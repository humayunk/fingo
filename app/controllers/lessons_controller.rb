class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: params[:title])
    step_number = params[:step]&.to_i || 1
    @step = @lesson.steps.find_by(order: step_number)
  end
end
