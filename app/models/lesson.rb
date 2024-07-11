# app/models/lesson.rb
class Lesson < ApplicationRecord
  validates :prompt, presence: true
  validates :target_language, presence: true
end