class CabinetSerializer
  include JSONAPI::Serializer

  set_type :cabinet
  set_id :id
  attributes :id, :name, :private, :slug, :tools

  attributes :class do |object|
    object.class.name
  end

  attributes :ingredients do |object|
    object.ingredients.map { |ingredient| 
      IngredientSerializer.new(ingredient).serializable_hash[:data][:attributes]
    }
  end
end