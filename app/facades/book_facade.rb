class BookFacade

  def initialize(location, quantity)
    @location = location
    @quantity = quantity
  end

  def get_book_data
    Book.new(@location, total_books_found, books)
  end

  def total_books_found
    book_data[:numFound]
  end

  def books
    book_data[:docs].map do |book_info|
      {
        title: book_info[:title],
        publisher: book_info[:publisher],
        isbn: book_info[:isbn]
      }
    end
  end

  private

  def book_service
    @_book_service ||= BookService.new
  end

  def book_data
    @_book_data ||= book_service.get_books(@location, @quantity)
  end 
end