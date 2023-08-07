class AirQualitySerializer
  include JSONAPI::Serializer

  def initialize(data)
    @data = data
  end

  def serialize
    return {} if @data.nil? || @data.empty?

    {
      "data": {
        "id": nil,
        "type": "air_quality",
        "city": @data[:city],
        "attributes": {
          "aqi": @data[:aqi],
          "pm25_concentration": @data[:PM_5][:concentration],
          "co_concentration": @data[:CO][:concentration] 
        }
      }
    }
  end
end