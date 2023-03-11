class RecipeSerializer
  include JSONAPI::Serializer

  set_type :category
  set_id :id
  attributes :name
end