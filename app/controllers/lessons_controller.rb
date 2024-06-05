class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: params[:title])
    # @step = Step.find_by(params[:id])
  end
end
