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

    # No admin page for handling users yet
    @user.admin = false

    if @user.save
      session[:userid] = @user.id
      redirect_to keys_path
    else
      render :action => "new"
    end
  end

  def destroy
  end

  private

  def link_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
