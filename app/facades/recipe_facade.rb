class RecipeFacade
  def get_recipes(country)
    recipes = RecipeService.new.get_recipes(country)
    
    if recipes[:hits].empty?
      [] # Return an empty array if there are no recipes for the country.
    else
      recipes[:hits].map do |recipe|
        Recipe.new(recipe, country)
      end
    end
  end
end
