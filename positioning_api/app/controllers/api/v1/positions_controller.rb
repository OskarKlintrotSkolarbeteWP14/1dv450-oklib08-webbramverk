class Api::V1::PositionsController < Api::V1::BaseController
  def index
    positions = Position.all
    render(
      json: ActiveModel::ArraySerializer.new(
        positions,
        each_serializer: Api::V1::PositionSerializer
      )
    )
  end

  def create
    position = Position.new(create_params)

    if position.save
      render(
        json: position,
        status: :created,
        location: api_v1_position_path(position.id),
        serializer: Api::V1::PositionSerializer
      )
    else
      render(
        json: position,
        status: :bad_request, # TODO: What is the correct HTTP status code?
        serializer: Api::V1::PositionSerializer
      )
    end
  end

  def show
    positions = Position.find(params[:id])
    render(json: Api::V1::PositionSerializer.new(positions))
  end

  def update
    position = Position.find(params[:id])

    if position.update_attributes update_params
      render(
        json: position,
        status: :ok
      )
    else
      render json: {
        status: 400,
        errors: 'Could not update position'
      }, status: :bad_request
    end
  end

  def destroy
    position = Position.find(destroy_params[:id])

    if position.destroy
      head status: :no_content
    else
      render json: {
        status: 400,
        errors: 'Could not delete position'
      }, status: :bad_request
    end
  end

  private

  def create_params
    parameters = ActionController::Parameters.new(
      position:
      {
        lng: params[:lng],
        lat: params[:lat],
        place: params[:place],
        region: params[:region],
        country: params[:country]
      }
    )
    parameters.require(:position).permit(:lng,
                                         :lat,
                                         :place,
                                         :region,
                                         :country)
  end

  def update_params
    create_params
  end

  def destroy_params
    params.permit(:id)
  end
end
