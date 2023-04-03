class CabinetSerializer
  include JSONAPI::Serializer

  set_type :cabinet
  set_id :id
  attributes :id, :name, :private, :slug, :tools

  attributes :class do |object|
    object.class.name
  end

  attributes :portions do |object|
    object.portions.map { |portion| 
      PortionSerializer.new(portion).serializable_hash[:data][:attributes]
    }
  end
end