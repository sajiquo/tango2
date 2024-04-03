require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  describe "GET /lessons" do
    it "returns json" do
      get "/lessons"
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
end
