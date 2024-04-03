require 'rails_helper'

RSpec.describe "Languages", type: :request do
  describe "GET /languages" do
    it "returns json" do
      get "/languages"
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
end
