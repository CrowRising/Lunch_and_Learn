class AirQualityService
  def conn 
    Faraday.new(url: 'https://api.api-ninjas.com') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Api-Key'] = ENV['AIR_API_KEY']
    end
  end

  def get_air_quality(capital)
    response = conn.get("v1/airquality?city=#{capital}")
    JSON.parse(response.body, symbolize_names: true)
  end
end