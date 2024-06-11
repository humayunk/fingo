class UserProgressesController < ApplicationController
  before_action :set_lesson, only: [:create]
  before_action :set_user_progress, only: [:update, :complete]

  def create
    @user_progress = UserProgress.new(user: current_user, lesson: @lesson, completed: false, score: 0, current_step: 1)
    # @user_progress.save
    # TODO: CODE redirect. Where do we want to redirect after creating user_progress?
    # juliette added this
    if @user_progress.save
      add_coins(10)
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
    if @user_progress.current_step == @user_progress.lesson.steps.count
      unless @user_progress.completed
        @user_progress.update(completed: true, current_step: 1, completed_date: Date.today)
        @user_progress.course.enrollments.active_for(current_user).increment!(:active_lesson)
        current_user.update_streak!
        add_coins(50)
        @previous_coin_amt = current_user.coins - 60
        if course_completed?(@user_progress.lesson.course, current_user)
          add_coins(100)
          @previous_coin_amt = current_user.coins - 160
        end
      end
      redirect_to celebration_lesson_path(@user_progress.lesson, previous_coin_amt: @previous_coin_amt)
    else
      redirect_to lesson_path(@user_progress.lesson.title), notice: "Please complete the steps."
    end
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

  def add_coins(amount)
    @current_user.increment!(:coins, amount)
  end

  def course_completed?(course, user)
    course.lessons.all? do |lesson|
      UserProgress.where(user: user, lesson: lesson, completed: true).exists?
    end
  end

end
