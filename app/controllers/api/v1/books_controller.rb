class Api::V1::BooksController < ApplicationController

  def index
    books = BookFacade.new(params[:country], params[:quantity]).get_book_data
    render json: BookSerializer.new(books)
    
  end
end