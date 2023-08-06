# frozen_string_literal: true

class CountryFacade
  def self.get_country(country)
    if country.nil? || country.empty?
      country_names = CountryService.new.all_countries.map { |country_data| country_data[:name][:common] }
      country_names.sample
    else
      country
    end
  end
end
