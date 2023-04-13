class RecipeSerializer
  include JSONAPI::Serializer

  set_type :recipe
  set_id :id
  attributes  :id, :name, :description, :categories, :slug, :steps, :tools, :users

  attributes :class do |object|
    object.class.name
  end

  attributes :portions do |object|
    object.portions.map { |portion| 
      PortionSerializer.new(portion).serializable_hash[:data][:attributes]
    }
  end
end