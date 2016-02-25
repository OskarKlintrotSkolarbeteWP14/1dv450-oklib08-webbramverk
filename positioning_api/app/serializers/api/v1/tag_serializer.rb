class Api::V1::TagSerializer < Api::V1::BaseSerializer
  attributes :id, :tag, :ops

  # has_many :ops, serializer: Api::V1::OpShortSerializer
end
