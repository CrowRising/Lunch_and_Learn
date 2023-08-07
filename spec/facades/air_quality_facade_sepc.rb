require 'rails_helper'

RSpec.describe 'Air Quality Facade' do
  describe 'class methods' do
    it 'can get air quality by capital of country', :vcr do
      country = 'Thailand'
      capital = 'Bangkok'

      country_service = CountryService.new
      air_quality_service = AirQualityService.new
      air_quality_facade = AirQualityFacade.new(country_service, air_quality_service)

      air_quality = air_quality_facade.get_air_quality_by_country(capital)

      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key(:overall_aqi)
    end
  end
end