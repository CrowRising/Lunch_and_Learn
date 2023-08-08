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
    end
  end
end