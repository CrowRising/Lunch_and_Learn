# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/recipes?country=thailand' do
  describe 'happy path' do
    it 'returns a list of recipes by country', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      country = 'thailand'

      get("/api/v1/recipes?country=#{country}", headers:)

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_a(Array)

      recipes[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to eq('null')
        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to eq('recipe')
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to be_a(Hash)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a(String)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a(String)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes][:url]).to be_a(String)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_a(String)
        expect(recipe[:attributes].keys.size).to eq(5)
      end
    end

    it 'returns an empty array if no recipes are found', :vcr do
      get '/api/v1/recipes?country=asdfasdfasdf'
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_a(Array)
      expect(recipes[:data]).to eq([])
    end
  end

  it 'returns a random country if one is not provided', :vcr do
    get '/api/v1/recipes'

    expect(response).to be_successful
    recipes = JSON.parse(response.body, symbolize_names: true)

    recipes[:data].each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq('null')
      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq('recipe')
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a(Hash)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes][:image]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to be_a(String)
    end
  end
end