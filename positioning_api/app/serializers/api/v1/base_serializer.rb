class Api::V1::BaseSerializer < ActiveModel::Serializer
  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end

  def position
    if object.position_id
      {
        id: object.position.id,
        url: api_v1_position_path(object.position.id)
      }
    end
  end

  def user
    if object.user_id
      {
        id: object.user.id,
        url: api_v1_user_path(object.user.id)
      }
    end
  end

  def tags
    if object.tag_ids
      tags = []
      object.tag_ids.each do |t|
        tags << { id: t, tag: Tag.find(t).tag, url: api_v1_tag_path(t) }
      end
      tags
    end
  end

  def ops
    if object.op_ids
      ops = []
      object.op_ids.each do |o|
        ops << { id: o, item: Op.find(o).item, url: api_v1_op_path(o) }
      end
      ops
    end
  end
end
