class Book
  attr_reader :location, :total_books_found, :books

  def initialize(location, total_books_found, books)
    @location = location
    @total_books_found = total_books_found
    @books = books
  end
end