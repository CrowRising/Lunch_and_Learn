require 'rails_helper'

RSpec.describe "Users Favorites", type: :request do
  describe "GET /api/v1/favorites", :vcr do
    it "returns a list of favorites for a user" do
      user = User.create(name: "Jedaphia", email: "bowwow@doggieatyle.com", password: "treats4lyf", password_confirmation: "treats4lyf")  
      fave1 = Favorite.create(country: "Thailand", recipe_link: "https://www.allrecipes.com/recipe/246628/thai-red-curry-chicken-soup/", recipe_title: "Thai Red Curry Chicken Soup", user_id: user.id)
      fave2 = Favorite.create(country: "Cuba", recipe_link: "https://www.foodandwine.com/recipes/cuban-black-beans", recipe_title: "Cuban Black Beans", user_id: user.id)

      get "/api/v1/favorites?api_key=#{user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end