class RecipeSerializer 
  include JSONAPI::Serializer
  attributes :id, :title, :image, :url, :country
end