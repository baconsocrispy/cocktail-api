class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :current_cabinet_id, :cabinets
end
