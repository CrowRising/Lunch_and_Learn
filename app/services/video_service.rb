# frozen_string_literal: true

class VideoService
  def get_videos(country)
    response = conn.get('/youtube/v3/search') do |req|
      req.params['q'] = country
      req.params['part'] = 'snippet'
      req.params['maxResults'] = 1
      req.params['type'] = 'video'
      req.params['channelId'] = 'UCJ5v_MCY6GNUBTO8-D3XoAg'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.googleapis.com') do |req|
      req.params['key'] = ENV['YOUTUBE_API_KEY']
    end
  end
end
