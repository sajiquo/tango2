# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"

 Dir.glob("./db/seed/**/*.json").each do |path|
  lang = File.basename(File.dirname(path))
  lesson = File.basename(path, ".json")
  a_language = Language.find_or_create_by(name: lang)
  a_lesson = Lesson.find_or_create_by(name: lesson)
  File.open(path) do |file|
    puts "seeding: #{path}"
    JSON.load(file).to_a.each do |word|
      a_word = Word.find_or_create_by(name: word["name"], meaning: word["meaning"])
      word["sentences"].to_a.each do |sentence|
        a_sentence = Sentence.find_or_create_by(text: sentence["text"], inflection: sentence["inflection"])
        a_word.sentences << a_sentence
      end
      a_lesson.words << a_word
    end
  end
  a_language.lessons << a_lesson
end
