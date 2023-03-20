class ToolSerializer
  include JSONAPI::Serializer
  attributes :id, :tool_type, :tool_brand
end