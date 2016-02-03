class KeysController < ApplicationController
  before_action :require_login
  before_action :set_cache_buster

  def index
  end

  def show
  end

  def new
    @key = Key.new
  end

  def create
    @key = Key.new(link_params)
    @key.user_id = current_user.id
    @key.api_key = SecureRandom.hex

    # Make sure the key has not been used before
    while Key.find_by_api_key(@key.api_key) do
      @key.api_key = SecureRandom.hex
    end

    if @key.save
      session[:keyid] = @key.id
      flash[:success] = "Applikationen lades till!"
      redirect_to keys_path
    else
      render :action => "new"
    end
  end

  def destroy
  end

  private

  def link_params
    params.require(:key).permit(:application)
  end
end
