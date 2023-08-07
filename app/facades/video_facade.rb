# frozen_string_literal: true

class VideoFacade
  def videos_of_country(country)
    video_data = VideoService.new.get_videos(country)

    video_data[:items].map do |video|
      Video.new(video)
    end
  end
end
