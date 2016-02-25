class Api::V1::UsersController < Api::V1::BaseController
  before_action :offset_params, only: [:index]
  skip_before_action :api_authenticate, only: [:index, :show, :create]

  def index
    users = User.all.limit(@limit).offset(@offset)
    render(
      json: ActiveModel::ArraySerializer.new(
        users,
        each_serializer: Api::V1::UserSerializer
      )
    )
  end

  def create
    user = User.new(create_params)
    if user.save
      render(
        json: user,
        status: :created,
        location: api_v1_user_path(user.id),
        serializer: Api::V1::UserSerializer
      )
    else
      render(
        json: user,
        status: :bad_request, # TODO: What is the correct HTTP status code?
        serializer: Api::V1::UserSerializer
      )
    end
  end

  def show
    users = User.find(params[:id])
    render(json: Api::V1::UserSerializer.new(users))
  end

  def update
    user = User.find(params[:id])

    if user.id != @current_user
      unauthorized(:update, :user)
    elsif user.update_attributes update_params
      render(
        json: user,
        status: :ok
      )
    else
      bad_request(:update, :user)
    end
  end

  def destroy
    user = User.find(destroy_params[:id])

    if user.id != @current_user
      unauthorized(:delete, :user)
    elsif user.destroy
      @current_user = nil
      logger.debug "@current_user: #{@current_user}"
      head status: :no_content
    else
      bad_request(:delete, :user)
    end
  end

  private

  def create_params
    parameters = all_parameters
    parameters.require(:user).permit(:username,
                                     :email,
                                     :first_name,
                                     :last_name,
                                     :password,
                                     :password_confirmation)
  end

  def update_params
    create_params
  end

  def destroy_params
    params.permit(:id)
  end
end
