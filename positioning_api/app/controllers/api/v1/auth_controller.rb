# Handling the login and return a JWT
class Api::V1::AuthController < Api::V1::BaseController
  skip_before_action :api_authenticate

  def api_auth
    if request.headers[:Authorization].present?
      authenticate_with_http_basic do |u, p|
        user = User.find_by_email(u)
        if user.authenticate(p)
          render json: { auth_token: encodeJWT(user) }
        else
          render json: {
            error: 'Invalid username or password'
          }, status: :unauthorized
        end
      end
    end
  end
end
