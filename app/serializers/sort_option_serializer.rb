class SortOptionSerializer
  include JSONAPI::Serializer

  set_type :sort_option
  set_id :id
  attributes :id, :name

  attributes :class do |object|
    object.class.name
  end
end