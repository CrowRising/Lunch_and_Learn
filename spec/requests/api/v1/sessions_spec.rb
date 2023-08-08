require 'rails_helper'

RSpec.describe 'Registered user login', type: :request do
  describe 'POST /api/v1/sessions', :vcr do
    it 'login user' do
      user = User.create!(name: "Odell", email: "goodboy@ruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
     
      user_params = {
        email: "goodboy@ruff.com",
        password: "treats4lyf"
      }

      headers = {"CONTENT_TYPE" => "application/json"}  
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

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
      expect(response_body[:data][:attributes][:name]).to eq(user.name)
      expect(response_body[:data][:attributes]).to have_key(:email)
      expect(response_body[:data][:attributes][:email]).to eq(user.email)
      expect(response_body[:data][:attributes][:email]).to be_a(String)
      expect(response_body[:data][:attributes]).to have_key(:api_key)
      expect(response_body[:data][:attributes][:api_key]).to be_a(String)
      expect(response_body[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(response_body[:data][:attributes]).to_not have_key(:password)
      expect(response_body[:data][:attributes]).to_not have_key(:password_confirmation)
    end

    it 'cannot login user with invalid info' do
      user = User.create!(name: "Odell", email: "goodboy@ruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")

      user_params = {
        email: "goodboy@ruff.com",
        password: "treat4lyffff"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq("Invalid credentials")
      expect(response_body[:error]).to be_a(String)
      expect(response_body).to_not have_key(:data)
      expect(response_body).to_not have_key(:attributes)
      expect(response_body).to_not have_key(:password)
      expect(response_body).to_not have_key(:password_confirmation)
    end
  end
end