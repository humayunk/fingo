class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: params[:title])
    @user_progress = @lesson.user_progresses.active_for(current_user)
    step_number = @user_progress.current_step || 1
    @step = @lesson.steps.find_by(order: step_number) || @lesson.steps.first
  end
end
