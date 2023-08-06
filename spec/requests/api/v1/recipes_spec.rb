require "rails_helper"

RSpec.describe "GET /api/v1/recipes?country=thailand" do
  describe "happy path" do
    it "returns a list of recipes by country", :vcr do
      headers = { "CONTENT_TYPE" => "application/json" }
      country = 'thailand'

      get "/api/v1/recipes?country=#{country}", headers: headers

      expect(response).to be_successful
    end
  end
end