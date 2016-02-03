class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(link_params)

    if @user.save
      redirect_to users_path
    else
      render :action => "new"
    end
  end

  def destroy
  end

  private

  def link_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
