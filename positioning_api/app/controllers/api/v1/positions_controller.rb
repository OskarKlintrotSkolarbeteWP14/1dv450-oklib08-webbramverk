class Api::V1::PositionsController < ApplicationController
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
  end

  def show
    position = Position.find(params[:id])
    render(json: Api::V1::PositionSerializer.new(position).to_json)
  end

  def update
  end

  def destroy
  end
end
