# app/facades/air_quality_facade.rb
class AirQualityFacade
  def initialize(country_service, air_quality_service)
    @country_service = country_service
    @air_quality_service = air_quality_service
  end

  def get_air_quality_by_country(country)
    country_data = @country_service.capital(capital)
    capital = country_data&.dig(0, :capital)
    air_quality_data = @air_quality_service.get_air_quality(capital)

    air_quality_data
  end
end
