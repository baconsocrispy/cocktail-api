class IngredientSerializer
  include JSONAPI::Serializer

  set_type :ingredient
  set_id :id
  attributes :id, :type, :name, :sub_type, :brand, :product, :abv, :age

  attributes :class do |object|
    object.class.superclass.name
  end
end