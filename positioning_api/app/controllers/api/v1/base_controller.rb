# A BaseController for v1 of this API
class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :destroy_session
  include Api::V1::BaseHelper
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def destroy_session
    request.session_options[:skip] = true
  end

  def not_found
    render json: { status: 404, errors: 'Not found' }, status: :not_found
  end

  def limit
    params[:limit].nil? ? 100 : params[:limit].to_i
  end

  def offset
    params[:offset].nil? ? 0 : params[:offset].to_i
  end
end
