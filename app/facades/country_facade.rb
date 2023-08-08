# frozen_string_literal: true

class CountryFacade

  def initialize(country)
    @country = country
  end

  def self.get_country(country)
    if country.nil? || country.empty?
      country_names = CountryService.new.all_countries.map { |country_data| country_data[:name][:common] }
      country_names.sample
    else
      country
    end
  end

  def get_capital(country)
    country_data = CountryService.new.get_country(country)
    country_data.first[:capital]
  end
end
