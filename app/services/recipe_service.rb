class RecipeService
  def self.conn 
    Faraday.new(url: 'https://api.edamam.com') do |faraday|
      faraday.params['app_id'] = ENV['EDA_ID']
      faraday.params['app_key'] = ENV['EDA_KEY']
    end
  end

  def self.get_recipes(country)
    response = conn.get("api/recipes/v2?type=public&q=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end