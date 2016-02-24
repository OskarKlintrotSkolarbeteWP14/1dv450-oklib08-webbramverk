class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :username, :email, :first_name, :last_name
  has_many :ops, serializer: Api::V1::OpShortSerializer
end
