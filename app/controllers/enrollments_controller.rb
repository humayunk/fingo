class EnrollmentsController < ApplicationController
  before_action :set_course
  # before_action :set_enrollment, only: [:complete_course]

  # POST /courses/:course_title/enrollments
  def create
    @enrollment = Enrollment.new
    @enrollment.course = @course
    @enrollment.user = current_user
    @enrollment.enrollment_date = Time.current
    # @enrollment.status = true # look into this, doesn't make sense
    @enrollment.active_lesson = 1 #active lesson should be the first one

    if @enrollment.save
      first_lesson = @enrollment.course.lessons.order(order_rank: :asc).first
      current_user.user_progresses.create(
        lesson: first_lesson,
        score: 0,
        current_step: 1,
        completed: false
      )
      add_coins(10)
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

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def add_coins(amount)
    @current_user.increment!(:coins, amount)
  end

  def set_current_user
    @current_user = @enrollment.user
  end
end
