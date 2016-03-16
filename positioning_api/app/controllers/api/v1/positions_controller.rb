class Api::V1::PositionsController < Api::V1::BaseController
  before_action :offset_params, only: [:index]
  skip_before_action :api_authenticate, only: [:index, :show]

  def index
    op_id = params[:op_id]

    if !op_id.nil?
      op = Op.find(op_id)
      positions = op.position
      render(json: Api::V1::PositionSerializer.new(positions))
    else
      positions = Position.all.limit(@limit).offset(@offset)
      render(
        json: ActiveModel::ArraySerializer.new(
          positions,
          each_serializer: Api::V1::PositionSerializer
        )
      )
    end


  end

  def create
    position = Position.new(create_params)
    position.user_id = @current_user

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

    if not_authenticated? position
      unauthorized(:opdate, :position)
    elsif position.update_attributes update_params
      render(
        json: position,
        status: :ok
      )
    else
      bad_request(:update, :position)
    end
  end

  def destroy
    position = Position.find(destroy_params[:id])

    if not_authenticated? position
      unauthorized(:delete, :position)
    elsif position.destroy
      head status: :no_content
    else
      bad_request(:delete, :position)
    end
  end

  private

  def create_params
    parameters = all_parameters
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
