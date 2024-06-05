class CoursesController < ApplicationController
  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/:title
  def show
    @course = Course.find_by(title: params[:title])
    return redirect_to courses_path, alert: "Course not found." unless @course
  end
end
