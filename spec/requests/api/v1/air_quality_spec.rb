# spec/requests/api/v1/air_quality_spec.rb

require "rails_helper"

RSpec.describe "Air Quality API", type: :request do
  describe "GET /api/v1/air_quality" do
    it "returns the air quality of the capital city", :vcr do
      
      allow(CountryFacade).to receive(:get_country).with("Nigeria").and_return("Nigeria")
      air_quality_facade = AirQualityFacade.new(CountryService.new, AirQualityService.new)
      allow(air_quality_facade).to receive(:get_air_quality_by_country).with("Nigeria").and_return(
        {
          city: "Abuja",
          aqi: 27,
          pm25_concentration: 8.45,
          co_concentration: 547.41
        }
      )
    
      get "/api/v1/air_quality", params: { country: "Nigeria" }

    
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["data"]).to be_present
      expect(parsed_response["data"]["id"]).to be_nil
      expect(parsed_response["data"]["type"]).to eq("air_quality")
      expect(parsed_response["data"]["city"]).to eq("Abuja")

      attributes = parsed_response["data"]["attributes"]
      expect(attributes["aqi"]).to eq(27)
      expect(attributes["pm25_concentration"]).to eq(8.45)
      expect(attributes["co_concentration"]).to eq(547.41)
    end
  end
end
