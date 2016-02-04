class KeysController < ApplicationController
  include KeysHelper

  before_action :require_login
  before_action :set_cache_buster

  def index
    @keys = Key.all.order('application') if admin?
  end

  def new
    @key = Key.new
  end

  def create
    @key = Key.new(link_params)
    @key.user_id = current_user.id

    if @key.save
      session[:keyid] = @key.id
      flash[:success] = 'Applikationen lades till!'
      redirect_to keys_path
    else
      render action: :new
    end
  end

  def destroy
    @key = Key.find(destroy_params[:id])

    if correct_rights @key
      no_rights
    elsif @key.destroy
      app_removed
    else
      an_error_accured
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
