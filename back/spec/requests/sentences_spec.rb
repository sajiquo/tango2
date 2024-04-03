require 'rails_helper'

RSpec.describe "Sentences", type: :request do
  describe "GET /sentences" do
    it "returns json" do
      get "/sentences"
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
end
