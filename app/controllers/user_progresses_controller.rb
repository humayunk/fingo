class UserProgressesController < ApplicationController
  before_action :set_lesson, only: [:create]
  before_action :set_user_progress, only: [:update]
  before_action :set_current_user, only: [:create]

  def create
    @user_progress = UserProgress.new
    @user_progress.lesson = @lesson
    @user_progress.completed = false
    @user_progress.score = 0
    @user_progress.current_step = 1

    # juliette added this
    if @user_progress.save
      add_coins(10)
      redirect_to lesson_path(@lesson.title, step: 1)
    else
      redirect_to course_path(@lesson.course.title), alert: "Could not start lesson."
    end
  end

  def update
    @enrollment = Enrollment.where(course: @user_progress.lesson.course, user: current_user)
    @lesson_list = @user_progress.lesson.course.lessons
    @user_progress_list = UserProgress.where(lesson: @lesson_list.pluck(:id), user: current_user)
    @user_progress.current_step = params[:step]
    if @user_progress.current_step == @user_progress.lesson.steps.count
      add_coins(50)
      @user_progress.update(completed: true)
      if @lesson_list.count == @user_progress_list.count
        @enrollment.update(completed: true)
        add_coins(100)
        redirect_to courses_path, notice: 'Course was successfully completed!'
      else
        redirect_to course_path(@enrollment.course)
      end
    else
      if @user_progress.save
        redirect_to lesson_path(@user_progress.lesson.title, step: params[:step])
      else
        redirect_to lesson_path(@user_progress.lesson.title), alert: "Could not update progress."
      end
    end

    # TODO: CODE redirect. Where do we want to redirect after updating user_progress?

    # redirect_to lesson_path(@user_progress.lesson, step: params[:step])

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

  def add_coins(coins)
    @current_user.coins += coins
    @current_user.save
  end

  def set_current_user
    @current_user = @user_progress.user
  end
end
