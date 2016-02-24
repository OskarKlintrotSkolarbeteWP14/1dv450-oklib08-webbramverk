class Api::V1::TagsController < ApplicationController
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
  end

  def show
    tag = Tag.find(params[:id])
    render(json: Api::V1::TagSerializer.new(tag).to_json)
  end

  def update
  end

  def destroy
  end
end
