class RecipeSerializer
  include JSONAPI::Serializer

  set_type :recipe
  set_id :id
  attributes  :id, :name, :description, :ingredients, :categories, :slug, :steps, :tools, :users
end