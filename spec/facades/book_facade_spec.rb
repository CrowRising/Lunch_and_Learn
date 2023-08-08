require 'rails_helper'

RSpec.describe BookFacade do
  describe 'instance methods' do
    it '#get_book_data', :vcr do
      book = BookFacade.new('France', 5).get_book_data

      expect(book).to be_a(Book)
      expect(book.city).to be_a(String)
      expect(book.total_books_found).to be_an(Integer)
      expect(book.books).to be_an(Array)
      expect(book.books.first).to have_key(:title)
      expect(book.books.first[:title]).to be_a(String)  
      expect(book.books.first).to have_key(:publisher)
      expect(book.books.first[:publisher]).to be_a(Array)
      expect(book.books.first).to have_key(:isbn)
      expect(book.books.first[:isbn]).to be_a(Array)
      expect(book.books.first[:isbn].first).to be_a(String)
    end
  end
end