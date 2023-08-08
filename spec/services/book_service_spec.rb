require 'rails_helper'

RSpec.describe BookService do
  describe 'instance methods' do
    it 'get_books', :vcr do
      book_service = BookService.new
      book_response = book_service.get_books('France', 5)

      expect(book_response).to be_a(Hash)
      expect(book_response).to have_key(:docs)
      expect(book_response[:docs]).to be_an(Array)

      book = book_response[:docs].first
  
      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_a(Array)
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_a(Array)
    end
  end
end