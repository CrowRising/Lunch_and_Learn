# frozen_string_literal: true

class CountryService
  def conn
    Faraday.new(url: 'https://restcountries.com/v3.1') do |faraday|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_countries
    get_url('all')
  end

  def get_country(country)
    get_url("name/#{country}")
  end
end
