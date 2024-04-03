require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe "GET /words" do
    it "returns json" do
      get "/words"
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
end
