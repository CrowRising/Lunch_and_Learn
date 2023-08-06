require 'rails_helper'

RSpec.describe RecipeService do
  it 'can get a list of recipes', :vcr do
    recipes = RecipeService.new.get_recipes('Thailand')

    expect(recipes).to be_a Hash
    expect(recipes).to have_key(:hits)
    expect(recipes[:hits]).to be_an Array
    expect(recipes[:hits].first).to have_key(:recipe)
    expect(recipes[:hits].first[:recipe]).to have_key(:label)
    expect(recipes[:hits].first[:recipe][:label]).to be_a String
    expect(recipes[:hits].first[:recipe]).to have_key(:image)
    expect(recipes[:hits].first[:recipe][:image]).to be_a String
    expect(recipes[:hits].first[:recipe]).to have_key(:url)
    expect(recipes[:hits].first[:recipe][:url]).to be_a String
  end
end