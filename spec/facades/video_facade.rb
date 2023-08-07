require 'rails_helper'

RSpec.describe 'Video Facade' do
  describe 'can get video data', :vcr do
    it 'returns video data' do
      country = 'Thailand'
      videos = VideoFacade.new.videos_of_country(country)

      expect(videos).to be_an Array
      expect(videos.first).to be_a Video
    end

    it 'returns video objects with attributes' do
      country = 'Thailand'
      videos = VideoFacade.new.videos_of_country(country)

      expect(videos.first).to be_a Video
      expect(videos.first.title).to be_a String
      expect(videos.first.title).to eq("Scott Steiner vs. Triple H — Arm Wrestling Match: On this day in 2002")
      expect(videos.first.youtube_video_id).to be_a String
      expect(videos.first.youtube_video_id).to eq("PPT79cfIAWs")
    end

    it 'returns an empty array if no videos are found' do
      country = 'asdfasdfasdf'
      videos = VideoFacade.new.videos_of_country(country)

      expect(videos).to eq([])
    end
  end
end