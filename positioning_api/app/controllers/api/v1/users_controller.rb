class Api::V1::UsersController < Api::V1::BaseController
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

    if user.update_attributes update_params
      render(
        json: user,
        status: :ok
      )
    else
      render json: {
        status: 400,
        errors: 'Could not update user'
      }, status: :bad_request
    end
  end

  def destroy
    user = User.find(destroy_params[:id])

    if user.destroy
      head status: :no_content
    else
      render json: {
        status: 400,
        errors: 'Could not delete user'
      }, status: :bad_request
    end
  end

  private

  def create_params
    parameters = ActionController::Parameters.new(
      user:
      {
        username: params[:username],
        email: params[:email],
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      }
    )
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
