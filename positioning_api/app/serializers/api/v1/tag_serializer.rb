class Api::V1::TagSerializer < Api::V1::BaseSerializer
  attributes :id, :tag

  has_many :ops, serializer: Api::V1::OpShortSerializer
end
