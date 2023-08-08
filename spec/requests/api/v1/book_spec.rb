require 'rails_helper'

RSpec.describe 'Book API' do
  describe 'happy path' do
    it 'returns book data for a given country', :vcr do
  
      get '/api/v1/book_search?location=France&quantity=5'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      book_data = JSON.parse(response.body, symbolize_names: true)

      expect(book_data).to be_a(Hash)
      expect(book_data).to have_key(:data)
      expect(book_data[:data]).to be_a(Hash)
      expect(book_data[:data]).to have_key(:id)
      expect(book_data[:data][:id]).to eq(nil)
      expect(book_data[:data]).to have_key(:type)
      expect(book_data[:data][:type]).to eq('books')
      expect(book_data[:data]).to have_key(:attributes)
      expect(book_data[:data][:attributes]).to be_a(Hash)
      expect(book_data[:data][:attributes]).to have_key(:city)
      expect(book_data[:data][:attributes][:city]).to be_a(String)
      expect(book_data[:data][:attributes][:city]).to eq('Paris')
      expect(book_data[:data][:attributes]).to have_key(:total_books_found)
      expect(book_data[:data][:attributes][:total_books_found]).to be_an(Integer)
      expect(book_data[:data][:attributes]).to have_key(:books)
      expect(book_data[:data][:attributes][:books]).to be_an(Array)
      expect(book_data[:data][:attributes][:books].first).to have_key(:title)
      expect(book_data[:data][:attributes][:books].first[:title]).to be_a(String)
      expect(book_data[:data][:attributes][:books].first).to have_key(:publisher)
      expect(book_data[:data][:attributes][:books].first[:publisher]).to be_a(Array)
      expect(book_data[:data][:attributes][:books].first).to have_key(:isbn)
      expect(book_data[:data][:attributes][:books].first[:isbn]).to be_a(Array)
      expect(book_data[:data][:attributes][:books].first[:isbn].first).to be_a(String)
    end
  end
end