# app/controllers/lessons_controller.rb
class LessonsController < ApplicationController
  def create
    @lesson = Lesson.create(lesson_params)
    LessonGeneratorJob.perform_later(@lesson.id)
    render json: { message: "Lesson generation started", lesson_id: @lesson.id }
  end

  def show
    @lesson = Lesson.find(params[:id])
    render json: @lesson
  end

  private

  def lesson_params
    params.require(:lesson).permit(:prompt, :target_language)
  end
end





# app/models/lesson.rb
class Lesson < ApplicationRecord
  validates :prompt, presence: true
  validates :target_language, presence: true
end