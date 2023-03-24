module AuthenticateUser
  extend ActiveSupport::Concern

  included do 
    before_action :authenticate_request!
  end

  def current_user
    user_id = decoded_token.first['user_id']
    current_user = User.find(user_id)
    return current_user
  end

  private
  def authenticate_request!
    if decoded_token.empty?
      render json: {
        status: {
          code: 401,
          message: 'User not authenticated',
        }
      }, status: :unauthorized
    end
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      jwt = auth_header&.split(' ')&.last
      secret = Rails.application.secrets.secret_key_base
      begin
        JWT.decode(jwt, secret, true, algorithm: 'HS256')
      rescue
        []
      end
    end
  end
end