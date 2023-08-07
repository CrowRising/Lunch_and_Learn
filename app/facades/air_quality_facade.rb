# app/facades/air_quality_facade.rb
class AirQualityFacade
  def initialize(country_service, air_quality_service)
    @country_service = country_service
    @air_quality_service = air_quality_service
  end

  def get_air_quality_by_country(country)
    capital = @country_service.get_capital(capital)
    air_quality_data = @air_quality_service.get_air_quality(capital)

    air_quality_data
  end
end

