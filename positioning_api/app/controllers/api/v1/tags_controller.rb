class Api::V1::TagsController < Api::V1::BaseController
  def index
    tags = Tag.all
    render(
      json: ActiveModel::ArraySerializer.new(
        tags,
        each_serializer: Api::V1::TagSerializer
      )
    )
  end

  def create
    tag = Tag.new(create_params)

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
  end

  def destroy
    tag = Tag.find(destroy_params[:id])

    if tag.destroy
      head status: :no_content
    else
      render json: {
        status: 400,
        errors: 'Could not delete tag'
      }, status: :bad_request
    end
  end

  private

  def create_params
    parameters = ActionController::Parameters.new(
      tag:
      {
        tag: params[:tag]
      }
    )
    parameters.require(:tag).permit(:tag)
  end

  def destroy_params
    params.permit(:id)
  end
end
