require 'rails_helper'

RSpec.describe AirQualityService do
  describe 'instance methods' do
    it 'can get air quality by country', :vcr do
      air_quality = AirQualityService.new.get_air_quality('Bangkok')

      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key(:overall_aqi)
    end
  end
end