class AirQualitySerializer
  def initialized(data)
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
          "pm25_concentration": @data[:pm25_concentration], #
          "co_concentration": @data[:co_concentration] 
        }
      }
    }
  end
end