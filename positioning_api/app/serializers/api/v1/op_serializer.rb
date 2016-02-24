class Api::V1::OpSerializer < Api::V1::BaseSerializer
  attributes :id, :item, :note, :datetime
  has_one :position, serializer: Api::V1::PositionShortSerializer
  has_many :tags, serializer: Api::V1::TagShortSerializer
  has_one :user, serializer: Api::V1::UserShortSerializer
end
