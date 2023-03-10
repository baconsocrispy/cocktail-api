class IngredientSerializer
  include JSONAPI::Serializer

  set_type :ingredient
  set_id :id
  attributes :type, :display_name, :sub_type, :brand, :product, :abv, :age, :recipes, :cabinets
end