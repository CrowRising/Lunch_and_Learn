require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe "POST /api/v1/favorites", :vcr do
    it "returns a favorite object with an api key" do
      user = User.create(name: "Jedaphia", email: "goodboy@ruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
      user_params = {
        api_key: user.api_key,
        country: "Thailand",
        recipe_link: "https://www.allrecipes.com/recipe/246628/thai-red-curry-chicken-soup/",
        recipe_name: "Thai Red Curry Chicken Soup"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/favorites", headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end