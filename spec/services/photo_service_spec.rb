# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Photo Service' do
  describe 'can create connection to unsplash' do
    it 'can get photo data', :vcr do
      photo_data = PhotoService.new.get_photos('Thailand')

      expect(photo_data).to be_a(Hash)
      expect(photo_data).to have_key(:results)

      photo_data[:results].each do |photo|
        expect(photo).to have_key(:urls)
        expect(photo).to have_key(:alt_description)
        expect(photo[:urls]).to have_key(:regular)
      end
    end
  end
end
