class RecipeSerializer
  include JSONAPI::Serializer

  set_type :recipe
  set_id :id
  attributes  :name, :description, :ingredients, :categories, :steps, :tools, :users
end