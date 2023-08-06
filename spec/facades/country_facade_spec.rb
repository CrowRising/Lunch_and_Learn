# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountryFacade do
  describe '.get_country' do
    it 'returns a valid country when is provided', :vcr do
      country = CountryFacade.get_country('Thailand')

      expect(country).to be_a String
      expect(country).to eq('Thailand')
      expect(country).to_not be_empty
    end

    it 'returns a random country when country is not provided', :vcr do
      country = CountryFacade.get_country(nil)

      expect(country).to be_a String
      expect(country).to_not be_empty
    end
  end
end
