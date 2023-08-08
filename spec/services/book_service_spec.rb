require 'rails_helper'

RSpec.describe BookService do
  describe 'instance methods' do
    it 'get_books', :vcr do
      book_service = BookService.new
      book_response = book_service.get_books('France', 5)

      expect(book_response).to be_a(Hash)
      expect(book_response).to have_key(:docs)
      expect(book_response[:docs]).to be_an(Array)
    end
  end
end