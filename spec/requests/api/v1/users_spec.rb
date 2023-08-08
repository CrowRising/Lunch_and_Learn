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

   it "returns an error if email is already taken" do
    User.create(name: "Jedaphia", email: "goodboy@ruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
    user_params = {
      name: "Odell",
      email: "goodboy@ruff.com", 
      password: "treats4lyf", 
      password_confirmation: "treats4lyf"
     }

     headers = {"CONTENT_TYPE" => "application/json"}
     post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

     expect(response).to_not be_successful
     expect(response.status).to eq(400)

     response_body = JSON.parse(response.body, symbolize_names: true)

     expect(response_body).to have_key(:errors)
     expect(response_body[:errors]).to eq(["Email has already been taken"])
     expect(response_body[:errors]).to be_a(Array)
   end

   it "returns an error if password and password confirmation do not match" do
    user_params = {
      name: "Odell",
      email: "goodboy@ruff.com", 
      password: "treats4lyf", 
      password_confirmation: "treat4lyfff"
     }

     headers = {"CONTENT_TYPE" => "application/json"}
     post "/api/v1/users", params: user_params

     expect(response).to_not be_successful
     expect(response.status).to eq(400)

     response_body = JSON.parse(response.body, symbolize_names: true)

     expect(response_body).to have_key(:errors)
     expect(response_body[:errors]).to eq(["Password confirmation doesn't match Password"])
     expect(response_body[:errors]).to be_a(Array)
   end
  end
end
