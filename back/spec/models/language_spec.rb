require 'rails_helper'

RSpec.describe Language, type: :model do
  let(:language) { Language.new({name: "Sanskrit"})}
  it "has name" do
    expect(language.name).to be_truthy
  end
end
