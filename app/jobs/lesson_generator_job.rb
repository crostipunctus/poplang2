# app/jobs/lesson_generator_job.rb
class LessonGeneratorJob < ApplicationJob
  queue_as :default

  def perform(lesson_id)
    lesson = Lesson.find(lesson_id)
    
    response = AIService.generate_lesson(lesson.prompt, lesson.target_language)
    
    lesson.update(
      scenario: response[:scenario],
      translated_scenario: response[:translated_scenario],
      keywords: response[:keywords],
      audio_url: response[:audio_url]
    )
  end
end