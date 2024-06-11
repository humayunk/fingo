class EnrollmentsController < ApplicationController
  before_action :set_course

  # POST /courses/:course_title/enrollments
  def create
    @enrollment = Enrollment.new(user: current_user, course: @course, enrollment_date: Time.current, completed: false, active_lesson: 1)

    if @enrollment.save
      raise
      first_lesson = @enrollment.course.lessons.order(order_rank: :asc).first
      current_user.user_progresses.create(
        lesson: first_lesson,
        score: 0,
        current_step: 1,
        completed: false
      )
      redirect_to first_lesson, notice: 'Successfully enrolled in the course and redirected to the first lesson.'
    else
      redirect_to @course, alert: 'Enrollment failed.'
    end
  end

  private

  def set_course
    @course = Course.find_by(title: params[:course_title])
    return redirect_to courses_path, alert: 'Course not found.' unless @course
  end

  def add_coins(coins)
    @current_user.coins += coins
    @current_user.save
  end
end
