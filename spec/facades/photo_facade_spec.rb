require 'rails_helper'

RSpec.describe 'Photo Facade' do
  describe 'can get photo data', :vcr do
    it 'returns photo data' do
      country = 'Thailand'
      photos = PhotoFacade.new.photos_of_country(country)

      expect(photos).to be_a(Array)
    end

    it 'returns photo objects with attributes' do
      country = 'Thailand'
      photos = PhotoFacade.new.photos_of_country(country)

      expect(photos.first).to be_a(Photo)
      expect(photos.first.id).to be_nil
      expect(photos.first.url).to be_a(String)
      expect(photos.first.alt_tag).to be_a(String)
    end

    it 'returns an empty array if no photos are found' do
      country = 'asdfasdfasdf'
      photos = PhotoFacade.new.photos_of_country(country)
      expect(photos).to eq([])
    end
  end
end