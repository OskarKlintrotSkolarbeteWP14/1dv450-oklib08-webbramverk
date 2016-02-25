class Api::V1::TagsController < Api::V1::BaseController
  before_action :offset_params, only: [:index]
  skip_before_action :api_authenticate, only: [:index, :show]

  def index
    tags = Tag.all.limit(@limit).offset(@offset)
    render(
      json: ActiveModel::ArraySerializer.new(
        tags,
        each_serializer: Api::V1::TagSerializer
      )
    )
  end

  def create
    tag = Tag.new(create_params)
    tag.user_id = @current_user

    if tag.save
      render(
        json: tag,
        status: :created,
        location: api_v1_tag_path(tag.id),
        serializer: Api::V1::TagSerializer
      )
    else
      render(
        json: tag,
        status: :bad_request, # TODO: What is the correct HTTP status code?
        serializer: Api::V1::TagSerializer
      )
    end
  end

  def show
    tag = Tag.find(params[:id])
    render(json: Api::V1::TagSerializer.new(tag))
  end

  def update
    tag = Tag.find(params[:id])

    if not_authenticated? tag
      unauthorized(:update, :tag)
    elsif tag.update_attributes update_params
      render(
        json: tag,
        status: :ok
      )
    else
      bad_request(:update, :tag)
    end
  end

  def destroy
    tag = Tag.find(destroy_params[:id])

    if not_authenticated? tag
      unauthorized(:delete, :tag)
    elsif tag.destroy
      head status: :no_content
    else
      bad_request(:delete, :tag)
    end
  end

  private

  def create_params
    parameters = all_parameters
    parameters.require(:tag).permit(:tag)
  end

  def update_params
    create_params
  end

  def destroy_params
    params.permit(:id)
  end
end
