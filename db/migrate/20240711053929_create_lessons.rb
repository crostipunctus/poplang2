class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :prompt
      t.string :target_language
      t.text :scenario
      t.text :translated_scenario
      t.json :keywords
      t.string :audio_url

      t.timestamps
    end
  end
end
