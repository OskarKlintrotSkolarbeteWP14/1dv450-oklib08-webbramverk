# Functions for taking care of authorization of users
module Api::V1::AuthHelper
  def api_authenticate
    if request.headers['Authorization'].present?
      auth_header = request.headers['Authorization'].split(' ').last
      token_payload = decodeJWT auth_header.strip
      if token_payload
        @current_user = token_payload[0]['user_id']
      else
        render json: {
          error: 'Broken token!'
        }, status: :bad_request
      end
    else
      render json: {
        error: 'Token must be included in the Authorization header!'
      }, status: :forbidden
    end
  end

  def encodeJWT(user)
    # TODO: exp should definitely be in a config file!
    payload = { user_id: user.id, exp: 2.hours.from_now.to_i }
    JWT.encode(
      payload,
      Rails.application.secrets.secret_key_base,
      'HS512'
    )
  end

  def decodeJWT(token)
    payload = JWT.decode(
      token,
      Rails.application.secrets.secret_key_base,
      'HS512'
    )
    if payload[0]['exp'] >= Time.now.to_i
      payload
    else
      render json: {
        error: 'The token has expired!'
      }, status: :bad_request
    end
  end
end
