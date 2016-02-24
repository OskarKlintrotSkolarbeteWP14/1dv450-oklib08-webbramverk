class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render(
      json: ActiveModel::ArraySerializer.new(
        users,
        each_serializer: Api::V1::UserSerializer
      )
    )
  end

  def create
  end

  def show
    user = User.find(params[:id])
    render(json: Api::V1::UserSerializer.new(user).to_json)
  end

  def update
  end

  def destroy
  end
end
