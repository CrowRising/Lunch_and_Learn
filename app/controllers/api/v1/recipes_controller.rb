# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def index
        country = CountryFacade.get_country(params[:country])
        recipes = RecipeFacade.new.get_recipes(country)
        render json: RecipeSerializer.new(recipes)
      end
    end
  end
end
