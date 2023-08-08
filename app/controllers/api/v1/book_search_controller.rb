class Api::V1::BookSearchController < ApplicationController

  def index
    city = CountryFacade.new(params[:location]).get_capital(params[:location]).first
    books = BookFacade.new(city, params[:quantity]).get_book_data
# require 'pry'; binding.pry
    render json: BookSerializer.new(books)
  end
end