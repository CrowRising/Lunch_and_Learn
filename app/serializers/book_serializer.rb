class BookSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :books
  attributes :location, :total_books_found, :books
end