require 'rails_helper'

RSpec.describe Sentence, type: :model do
  let(:sentence) { Sentence.new({text: "this is sample text", inflection: "sample"})}
  it "has text" do
    expect(sentence.text).to be_truthy
    expect(sentence.inflection).to be_truthy
  end
end
