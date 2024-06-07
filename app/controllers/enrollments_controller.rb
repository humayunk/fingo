class EnrollmentsController < ApplicationController
  before_action :set_course
  before_action :set_enrollment, only: [:complete_course]

  # POST /courses/:course_title/enrollments
  def create
    @enrollment = Enrollment.new
    @enrollment.course = @course
    @enrollment.user = current_user
    @enrollment.enrollment_date = Time.current
    @enrollment.status = true

    if @enrollment.save
      redirect_to @course, notice: 'Successfully enrolled in the course.'
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

  def add_coins(coins)
    @current_user.coins += coins
    @current_user.save
  end

  def set_current_user
    @current_user = @enrollment.user
  end
end
