class CountryFacade
  def self.get_country(country)
    if country.nil? || country.empty?
      country_names = CountryService.new.all_countries.map { |country_data| country_data[:name][:common] }
      country = country_names.sample
    else
      country
    end

    # recipes = RecipeService.new.get_recipes(country)

    # if recipes.empty?
    #   { data: [] }
    # else
    #   recipe = recipes.sample
    #   RecipeData.new(recipe[:label], recipe[:url], country, recipe[:image])
    # end
  end
end

