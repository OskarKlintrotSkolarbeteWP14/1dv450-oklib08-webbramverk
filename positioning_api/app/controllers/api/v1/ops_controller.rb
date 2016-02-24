class Api::V1::OpsController < Api::V1::BaseController
  def index
    ops = Op.all
    render(
      json: ActiveModel::ArraySerializer.new(
        ops,
        each_serializer: Api::V1::OpSerializer
      )
    )
  end

  def create
    op = Op.new(create_params)

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
    parameters = ActionController::Parameters.new(
      op:
      {
        position_id: params[:position_id],
        user_id: params[:user_id],
        tag_ids: params[:tag_ids],
        item: params[:item],
        note: params[:note],
        datetime: params[:datetime]
      }
    )
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
end
