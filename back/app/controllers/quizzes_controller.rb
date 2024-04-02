 
class QuizzesController < ApplicationController
  before_action :set_lesson, only: %i[index]

  # GET /lessons/1/quiz
  def index
    render json: @lesson.generate_quiz_list(params[:limit])
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

end
