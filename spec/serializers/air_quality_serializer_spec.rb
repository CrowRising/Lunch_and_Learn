require 'rails_helper'

RSpec.describe 'Air Quality Serializer' do
  describe 'serializes air quality data' do
    it 'can serialize air quality data', :vcr do
      data = {
        city: 'Bangkok',
        aqi: 2,
        PM_5: { concentration: 2.5 },
        CO: { concentration: 2.5 }
      }

      serializer = AirQualitySerializer.new(data)
      serialized_data = serializer.serialize

      expected_output = {
        "data": {
          "id": nil,
          "type": "air_quality",
          "city": "Bangkok",
          "attributes": {
            "aqi": 2,
            "pm25_concentration": 2.5,
            "co_concentration": 2.5
          }
        }
      }

      expect(serialized_data).to eq(expected_output)
    end
  end
end