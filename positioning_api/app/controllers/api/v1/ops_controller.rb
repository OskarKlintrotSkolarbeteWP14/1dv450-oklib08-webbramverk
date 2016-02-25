class Api::V1::OpsController < Api::V1::BaseController
  before_action :offset_params, only: [:index]
  skip_before_action :api_authenticate, only: [:index, :show]

  def index
    tag_id = params[:tag_id]
    position_id = params[:position_id]
    user_id = params[:user_id]
    sort = params[:sort]
    sort_order = :updated_at if sort == 'updated'
    sort_order = :created_at if sort == 'created'

    unless tag_id.nil?
      tag = Tag.find(tag_id)
      ops = tag.ops
    end

    unless position_id.nil?
      position = Position.find(position_id)
      ops = position.ops
    end

    unless user_id.nil?
      user = User.find(user_id)
      ops = user.ops
    end

    ops = ops.limit(@limit).offset(@offset) if ops # Not very functional

    ops = Op.all
            .order(sort_order)
            .limit(@limit)
            .offset(@offset)
            .reverse unless ops

    render(
      json: ActiveModel::ArraySerializer.new(
        ops,
        each_serializer: Api::V1::OpSerializer
      )
    )
  end

  def create
    op = Op.new(create_params)

    tag_ids.each do |t|
      op.tags << Tag.find(t)
    end

    tags.each do |t|
      tag = Tag.find_by_tag(t) || Tag.create(tag: t)
      op.tags << tag
    end

    if op.save
      render(
        json: op,
        status: :created,
        location: api_v1_op_path(op.id),
        serializer: Api::V1::OpSerializer
      )
    else
      render(
        json: op,
        status: :bad_request, # TODO: What is the correct HTTP status code?
        serializer: Api::V1::OpSerializer
      )
    end
  end

  def show
    ops = Op.find(params[:id])
    render(json: Api::V1::OpSerializer.new(ops))
  end

  def update
    op = Op.find(params[:id])

    if op.update_attributes update_params
      # TODO: A quick and dirty way to save the tags, needs to be fixed
      tag_ids.each do |t|
        op.tags << Tag.find(t)
      end
      tags.each do |t|
        tag = Tag.find_by_tag(t) || Tag.create(tag: t)
        op.tags << tag
      end
      op.save
      render(
        json: op,
        status: :ok
      )
    else
      render json: {
        status: 400,
        errors: 'Could not update op'
      }, status: :bad_request
    end
  end

  def destroy
    op = Op.find(destroy_params[:id])

    if op.destroy
      head status: :no_content
    else
      render json: {
        status: 400,
        errors: 'Could not delete op'
      }, status: :bad_request
    end
  end

  private

  def create_params
    parameters = all_parameters
    parameters.require(:op).permit(:position_id,
                                   :user_id,
                                   :tag_ids,
                                   :item,
                                   :note,
                                   :datetime)
  end

  def update_params
    create_params
  end

  def destroy_params
    params.permit(:id)
  end

  def tag_ids
    params[:tag_ids]
  end

  def tags
    params[:tags]
  end
end
