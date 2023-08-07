require 'rails_helper'

RSpec.describe 'Video Service' do
  describe 'can create connection to youtube' do
    it 'can get video data', :vcr do
      country = 'Thailand'
      video_data = VideoService.new.get_videos(country)

      expect(video_data).to be_a(Hash)
      expect(video_data).to have_key(:items)
require 'pry'; binding.pry
      video_data[:items].each do |video|
        expect(video).to have_key(:id)
        expect(video[:id]).to have_key(:videoId)
        expect(video[:id][:videoId]).to be_a(String)
        expect(video).to have_key(:snippet)
        expect(video[:snippet]).to have_key(:title)
        expect(video[:snippet][:title]).to be_a(String)
      end
    end
  end
end