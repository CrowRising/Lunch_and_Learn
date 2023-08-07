# frozen_string_literal: true

class PhotoService
  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['UNSPLASH_API_KEY']
      f.headers['Content-Type'] = 'application/json'
      f.headers['X-Total'] = '10'
    end
  end

  def get_photos(country)
    response = conn.get('/search/photos') do |req|
      req.params['query'] = country
      req.params['per_page'] = 10
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
