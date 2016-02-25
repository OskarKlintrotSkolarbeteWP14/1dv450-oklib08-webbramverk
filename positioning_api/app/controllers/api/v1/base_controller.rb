# A BaseController for v1 of this API
class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :destroy_session
  before_action :validate_api_key
  include Api::V1::BaseHelper
  include ApikeyDashboard::KeysHelper
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def destroy_session
    request.session_options[:skip] = true
  end

  def not_found
    render json: { status: 404, errors: 'Not found' }, status: :not_found
  end

  def offset_params
    @offset = params[:offset].nil? ? 0 : params[:offset].to_i
    @limit = params[:limit].nil? ? 100 : params[:limit].to_i
  end

  def validate_api_key
    api_key = request.headers['X-ApiKey']
    wrong_key unless valid_api_key api_key
 end

 def wrong_key
   render json: { status: 401, errors: 'Unauthorized' }, status: :unauthorized
 end
end
