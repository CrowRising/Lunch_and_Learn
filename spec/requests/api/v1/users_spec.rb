require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /api/v1/users", :vcr do
   it "returns a user object with an api key" do
  
      user_params = {
        name: "Odell", 
        email: "goodboy@ruff.com", 
        password: "treats4lyf", 
        password_confirmation: "treats4lyf"
       }

    post "/api/v1/users", params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to be_a(Hash)
    expect(response_body[:data]).to have_key(:id)
    expect(response_body[:data][:id]).to be_a(String)
    expect(response_body[:data]).to have_key(:type) 
    expect(response_body[:data][:type]).to be_a(String) 
    expect(response_body[:data]).to have_key(:attributes)
    expect(response_body[:data][:attributes]).to be_a(Hash)
    expect(response_body[:data][:attributes]).to have_key(:name)
    expect(response_body[:data][:attributes][:name]).to be_a(String)
    expect(response_body[:data][:attributes][:name]).to eq(user_params[:name])
    expect(response_body[:data][:attributes]).to have_key(:email)
    expect(response_body[:data][:attributes][:email]).to eq(user_params[:email])  
    expect(response_body[:data][:attributes][:email]).to be_a(String)
    expect(response_body[:data][:attributes]).to have_key(:api_key)
   end
  end
end
