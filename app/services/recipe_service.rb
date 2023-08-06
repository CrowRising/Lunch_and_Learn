# frozen_string_literal: true

class RecipeService
  def conn
    Faraday.new(url: 'https://api.edamam.com') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params['type'] = 'public'
      faraday.params['app_id'] = ENV['EDA_ID']
      faraday.params['app_key'] = ENV['EDA_KEY']
    end
  end

  def get_recipes(country)
    response = conn.get("api/recipes/v2?q=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
