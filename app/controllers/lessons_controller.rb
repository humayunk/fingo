class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :celebration]
  def show
    @user_progress = @lesson.user_progresses.active_for(current_user)

    step_number = @user_progress.current_step || 1
    @step = @lesson.steps.find_by(order: step_number) || @lesson.steps.first
  end

  def celebration
  end

  private

  def set_lesson
    @lesson = Lesson.find_by(title: params[:title])
  end

  def set_ordered_lessons
    @ordered_lessons = @lesson.course.lessons.order(:order_rank)
  end
end
