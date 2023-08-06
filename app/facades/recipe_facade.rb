class RecipeFacade
  def get_recipes(country)
    recipes = RecipeService.new.get_recipes(country)
    recipes[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end