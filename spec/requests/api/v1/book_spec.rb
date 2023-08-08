require 'rails_helper'

RSpec.describe 'Book API' do
  describe 'happy path' do
    it 'returns book data for a given country', :vcr do
     book_facade = BookFacade.new('France', 5)
     allow(BookFacade).to receive(:new).and_return(book_facade) 
      get '/api/v1/books?country=France&quantity=5'

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end