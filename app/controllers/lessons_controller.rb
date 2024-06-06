class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: params[:title])
    step_number = params[:step]&.to_i || 1
    session.delete(:last_step) # Clear the session after retrieving the step
    @step = @lesson.steps.find_by(order: step_number) || @lesson.steps.first
  end
end
