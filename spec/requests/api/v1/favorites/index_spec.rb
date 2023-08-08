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

      response_body = JSON.parse(response.body, symbolize_names: true)
     
      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)  
      expect(response_body[:data]).to be_an(Array)
      expect(response_body[:data][0]).to have_key(:id)
      expect(response_body[:data][0][:id]).to be_a(String)
      expect(response_body[:data][0]).to have_key(:type)
      expect(response_body[:data][0][:type]).to be_a(String)
      expect(response_body[:data][0][:type]).to eq("favorite")
      expect(response_body[:data][0]).to have_key(:attributes)
      expect(response_body[:data][0][:attributes]).to be_a(Hash)
      expect(response_body[:data][0][:attributes]).to have_key(:country)  
      expect(response_body[:data][0][:attributes][:country]).to be_a(String)
      expect(response_body[:data][0][:attributes]).to have_key(:recipe_link)
      expect(response_body[:data][0][:attributes][:recipe_link]).to be_a(String)
      expect(response_body[:data][0][:attributes]).to have_key(:recipe_title)
      expect(response_body[:data][0][:attributes][:recipe_title]).to be_a(String)
      expect(response_body[:data][0][:attributes]).to have_key(:created_at)
      expect(response_body[:data][0][:attributes][:created_at]).to be_a(String)
    end
    
    it "returns an error message without an api key" do
      user = User.create(name: "Jedaphia", email: "bowwow@doggieatyle.com", password: "treats4lyf", password_confirmation: "treats4lyf")  
      fave1 = Favorite.create(country: "Thailand", recipe_link: "https://www.allrecipes.com/recipe/246628/thai-red-curry-chicken-soup/", recipe_title: "Thai Red Curry Chicken Soup", user_id: user.id)
      fave2 = Favorite.create(country: "Cuba", recipe_link: "https://www.foodandwine.com/recipes/cuban-black-beans", recipe_title: "Cuban Black Beans", user_id: user.id)

      get "/api/v1/favorites?api_key=123456789"

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to be_a(String)
      expect(response_body[:error]).to eq("Unauthorized user")
    end

    it 'returns empty array if user has no favorites' do
      user = User.create(name: "Jedaphia", email: "bowwow@doggieatyle.com", password: "treats4lyf", password_confirmation: "treats4lyf")  

      get "/api/v1/favorites?api_key=#{user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:data]).to eq([])
    end
  end
end