class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by_email params[:email]

    if user && user.authenticate(params[:password])
      login user
      redirect_to apikeys_path
    else
      flash[:danger] = "Felaktig e-post eller lösenord."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "Du har nu blivit utloggad."
    redirect_to login_path
  end

  def api_auth
  end
end
