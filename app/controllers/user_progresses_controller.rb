class UserProgressesController < ApplicationController
  before_action :set_lesson, only: [:create]
  before_action :set_user_progress, only: [:update, :complete]

  def create
    @user_progress = UserProgress.new(user: current_user, lesson: @lesson, completed: false, score: 0, current_step: 1)
    # @user_progress.save
    # TODO: CODE redirect. Where do we want to redirect after creating user_progress?
    # juliette added this
    if @user_progress.save
      redirect_to lesson_path(@lesson.title)
    else
      redirect_to course_path(@lesson.course.title), alert: "Could not start lesson."
    end
  end

  def update
    @user_progress.current_step = params[:step]

    if @user_progress.save
      # Hey team, just testing the streak here, should be update when lesson is marked as completed
      redirect_to lesson_path(@user_progress.lesson.title, step: params[:step])
    else
      redirect_to lesson_path(@user_progress.lesson.title), alert: "Could not update progress."
    end

    # @user_progress.increment(:score)

    # TODO: more logic required for validating answers later on in project.
    # if step is just content, move to next step. If it is a question, will have to validate answer
    # before moving to next step
  end

  def complete
    current_user.streak += 1
    current_user.save
    if @user_progress.current_step == @user_progress.lesson.steps.count
      @user_progress.update(completed: true)
      redirect_to celebration_lesson_path(@user_progress.lesson)
    else
      redirect_to lesson_path(@user_progress.lesson.title), notice: "Please complete the steps."
    end
  end

  private

  def update_streak
    current_user.streak = 0 if UserProgress.where(user: current_user, completed_date: Date.today - 1).empty?
    current_user.streak += 1 if UserProgress.where(user: current_user, completed_date: Date.today).length == 1
  end

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
