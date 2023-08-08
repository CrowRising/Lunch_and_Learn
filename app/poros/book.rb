class Book
  attr_reader :city, :total_books_found, :books

  def initialize(city, total_books_found, books)
    @city = city
    @total_books_found = total_books_found
    @books = books
  end
end