# app/services/ai_service.rb
class AIService
  include HTTParty
  base_uri 'http://your-flask-service.com'

  def self.generate_lesson(prompt, target_language)
    response = post("/generate", body: { 
      prompt: prompt, 
      target_language: target_language 
    })
    JSON.parse(response.body, symbolize_names: true)
  end
end