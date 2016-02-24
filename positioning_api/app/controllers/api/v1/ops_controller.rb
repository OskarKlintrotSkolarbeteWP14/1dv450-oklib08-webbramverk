class Api::V1::OpsController < ApplicationController
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
  end

  def show
    ops = Op.find(params[:id])
    render(json: Api::V1::OpSerializer.new(ops).to_json)
  end

  def update
  end

  def destroy
  end
end
