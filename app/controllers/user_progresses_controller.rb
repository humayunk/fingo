class UserProgressesController < ApplicationController
  before_action :set_lesson, only: [:create]
  before_action :set_user_progress, only: [:update]

  def create
    @user_progress = UserProgress.new
    @user_progress.user = current_user
    @user_progress.lesson = @lesson
    @user_progress.completed = false
    @user_progress.score = 0
    @user_progress.current_step = 1
    @user_progress.save

    # TODO: CODE redirect. Where do we want to redirect after creating user_progress?
  end

  def update
    if @user_progress.current_step >= @user_progress.lesson.steps.count
      @user_progress.update(completed: true)
    else
      @user_progress.increment(:current_step)
    end

    @user_progress.increment(:score)
    @user_progress.save

    # TODO: CODE redirect. Where do we want to redirect after updating user_progress?

    # TODO: more logic required for validating answers later on in project.
    # if step is just content, move to next step. If it is a question, will have to validate answer
    # before moving to next step
  end

  private

  def set_lesson
    @lesson = Lesson.find_by!(title: params[:lesson_title])
  end

  # Strong params(below) not presently required. Left code here in case require for future.
  # def user_progress_params
  #   params.require(:user_progress).permit(:user_id, :lesson_id, :completed, :score, :current_step)
  # end

  def set_user_progress
    @user_progress = UserProgress.find(params[:id])
  end
end
