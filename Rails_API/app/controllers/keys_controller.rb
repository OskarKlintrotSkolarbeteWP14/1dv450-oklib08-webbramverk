class KeysController < ApplicationController
  before_action :require_login
  before_action :set_cache_buster

  def index
    if is_admin?
      @keys = Key.all.order("application")
    end
  end

  def new
    @key = Key.new
  end

  def create
    @key = Key.new(link_params)
    @key.user_id = current_user.id

    if @key.save
      session[:keyid] = @key.id
      flash[:success] = "Applikationen lades till!"
      redirect_to keys_path
    else
      render :action => "new"
    end
  end

  def destroy
    @key = Key.find(destroy_params[:id])

    if @key.user_id != current_user.id && !is_admin?
      flash[:danger] = "Du har inte rättigheter för att ta bort denna applikationen!"
    elsif @key.destroy
      flash[:success] = "Applikationen togs bort!"
    else
      flash[:danger] = "Ett fel uppstod, försök igen senare."
    end
    redirect_to keys_path
  end

  private

  def link_params
    params.require(:key).permit(:application)
  end

  def destroy_params
    params.permit(:id)
  end
end
