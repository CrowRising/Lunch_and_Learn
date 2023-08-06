require 'rails_helper'

RSpec.describe CountryService do
  it 'can get a list of countries', :vcr do
    countries = CountryService.new.get_countries

    expect(countries).to be_an Array

    countries.each do |country|
      expect(country).to have_key(:name)
      expect(country[:name]).to be_a Hash
      expect(country[:name]).to have_key(:common)
      expect(country[:name][:common]).to be_a String
    end
  end

  it 'can get a country by name', :vcr do
    country = CountryService.new.get_country('Thailand')

    expect(country).to be_an Array
    expect(country.first).to have_key(:name)
    expect(country.first[:name]).to be_a Hash
    expect(country.first[:name]).to have_key(:common) 
    expect(country.first[:name][:common]).to be_a String
    expect(country.first[:name][:common]).to eq('Thailand')
  end
end