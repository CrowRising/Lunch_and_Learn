class BookFacade

  def initialize(location, quantity)
    @location = location
    @quantity = quantity
  end

  private

  def book_service
    @_book_service ||= BookService.new
  end

  def book_data
    @_book_data ||= book_service.get_books(@location, @quantity)
  end 

  def country_facade
    @_country_facade ||= CountryFacade.new(@location)
  end
end