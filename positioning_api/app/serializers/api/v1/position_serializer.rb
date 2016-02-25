class Api::V1::PositionSerializer < Api::V1::BaseSerializer
  attributes :id, :lng, :lat, :place, :region, :country, :ops

  # has_many :ops, serializer: Api::V1::OpShortSerializer
end
