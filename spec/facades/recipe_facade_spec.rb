require 'rails_helper'

RSpec.describe "Recipe Facade" do
  describe "class methods" do
    it "returns a list of recipes by country", :vcr do
      recipes = RecipeFacade.new.get_recipes('Thailand')

      expect(recipes).to be_an Array
      expect(recipes.first).to be_a Recipe
      expect(recipes.first.title).to be_a String
      expect(recipes.first.image).to be_a String
      expect(recipes.first.url).to be_a String
      expect(recipes.first.country).to be_a String
      expect(recipes.first.country).to eq('Thailand')
      expect(recipes.first.title).to_not be_empty
      expect(recipes.first.image).to_not be_empty
      expect(recipes.first.url).to_not be_empty
      expect(recipes.first.country).to_not be_empty
      expect(recipes.first.id).to eq('null')
    end

    it "returns an empty array when there are no recipes for the country", :vcr do
      #
      recipes = RecipeFacade.new.get_recipes('NonexistentCountry')

      expect(recipes).to be_an Array
      expect(recipes).to be_empty
    end
  end
end