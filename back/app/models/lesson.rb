class Lesson < ApplicationRecord
  has_many :words
  has_many :sentences, through: :words

  def quiz(limit)
    limit ||= 10
    sentences = words.flat_map(&:sentences)
    all_options = sentences.map(&:inflection)
    quizzes = sentences.sample(limit.to_i).map do |s|
        {text: s.text.gsub(s.inflection, "____"), options: (all_options.select{|op| op != s.inflection}.sample(3) + [s.inflection]).shuffle, answer: s.inflection}
      end
    quizzes.as_json
  end
end
