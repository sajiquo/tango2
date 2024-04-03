require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:lesson) { Lesson.new({name: "lesson1"})}
  it "has name" do
    expect(lesson.name).to be_truthy
  end
end
