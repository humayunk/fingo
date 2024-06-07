class UserProgressesController < ApplicationController
  before_action :set_lesson, only: [:create]
  before_action :set_user_progress, only: [:update, :complete]
  before_action :set_current_user, only: [:create]

  def create
    @user_progress = UserProgress.new(user: current_user, lesson: @lesson, completed: false, score: 0, current_step: 1)

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
      @user_progress.update(completed: true, completed_date: Date.today)
      if @lesson_list.count == @user_progress_list.count
        @enrollment.update(completed: true)
        add_coins(100)
        redirect_to courses_path, notice: 'Course was successfully completed!'
      else
        redirect_to lesson_path(@user_progress.lesson), notice: 'Lesson was successfully completed!'
      end
    else
      if @user_progress.save
        redirect_to lesson_path(@user_progress.lesson, step: @user_progress.current_step)
      else
        redirect_to lesson_path(@user_progress.lesson), alert: "Could not update progress."
      end
    end
  end

  private

  def update_streak
    current_user.streak = 0 if UserProgress.where(user: current_user, completed_date: Date.today - 1).empty?
    current_user.streak += 1 if UserProgress.where(user: current_user, completed_date: Date.today).length == 1
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_user_progress
    @user_progress = UserProgress.find(params[:id])
  end

  def set_current_user
    @current_user = current_user
  end

  def add_coins(amount)
    @current_user.increment!(:coins, amount)
  end
end
