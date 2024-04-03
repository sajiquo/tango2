require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:word) { Lesson.new({name: "sample"})}
  it "has name" do
    expect(word.name).to be_truthy
  end
end
