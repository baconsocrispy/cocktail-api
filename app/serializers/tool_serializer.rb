class ToolSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :tool_brand

  attributes :class do |object|
    object.class.name
  end
end