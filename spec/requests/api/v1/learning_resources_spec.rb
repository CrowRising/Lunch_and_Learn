require 'rails_helper'

RSpec.describe 'Learning Resources API' do
  describe 'can get learning resources' do
    it 'returns learning resources for country', :vcr do
      country = 'Thailand'
      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      learning_resources = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resources).to be_a(Hash)
      expect(learning_resources).to have_key(:data)
      expect(learning_resources[:data]).to be_a Hash
      expect(learning_resources[:data]).to have_key(:id)
      expect(learning_resources[:data][:id]).to eq(nil)
      expect(learning_resources[:data]).to have_key(:type)
      expect(learning_resources[:data][:type]).to be_a(String)
      expect(learning_resources[:data][:type]).to eq('learning_resource')
      expect(learning_resources[:data]).to have_key(:attributes)
      expect(learning_resources[:data][:attributes]).to be_a(Hash)
      expect(learning_resources[:data][:attributes][:country]).to be_a(String)
      expect(learning_resources[:data][:attributes][:country]).to eq(country)
      expect(learning_resources[:data][:attributes]).to have_key(:video)
      expect(learning_resources[:data][:attributes][:video]).to have_key(:title)
      expect(learning_resources[:data][:attributes][:video][:title]).to be_a(String)
      expect(learning_resources[:data][:attributes][:video]).to have_key(:youtube_video_id)
      expect(learning_resources[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
      expect(learning_resources[:data][:attributes]).to have_key(:images)
      expect(learning_resources[:data][:attributes][:images]).to be_an(Array)
      expect(learning_resources[:data][:attributes][:images].size).to eq(10)

      learning_resources[:data][:attributes][:images].each do |image|
        expect(image).to have_key(:alt_tag)
        expect(image[:alt_tag]).to be_a(String)
        expect(image).to have_key(:url)
        expect(image[:url]).to be_a(String)
      end 
    end
  end
end