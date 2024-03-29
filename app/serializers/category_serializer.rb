class CategorySerializer
  include JSONAPI::Serializer

  set_type :category
  set_id :id
  attributes :id, :name

  attributes :class do |object|
    object.class.name
  end
end