class PortionSerializer
  include JSONAPI::Serializer

  set_type :portion
  set_id :id
  attributes :id, :amount, :unit, :ingredient_id

  attributes :name do |object|
    object.ingredient.name
  end

  attributes :class do |object|
    object.class.name
  end
end