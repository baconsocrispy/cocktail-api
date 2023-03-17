class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :default_cabinet_id, :cabinets
end
