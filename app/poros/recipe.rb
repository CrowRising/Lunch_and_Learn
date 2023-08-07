# frozen_string_literal: true

class Recipe
  attr_reader :title, :image, :url, :country, :id

  def initialize(data, country)
    @title = data[:recipe][:label]
    @image = data[:recipe][:image]
    @url = data[:recipe][:url]
    @country = country
    @id = 'null'
  end
end
