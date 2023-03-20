class API::V1::AuthController < ApplicationController
  include RackSessionFix
  respond_to :json

  def signup

  end

  def signin
    @user = User.new(user_params)

    return invalid_email_response unless @user

    # verify password and log in user
    if @user.valid_password?(user_params[:password])
      sign_in :user, @user
      return sign_in_success_response(@user)
    else
      return invalid_password_response
    end
  end

  def signout

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  # response messages
  def invalid_email_response
    render json: {
      status: {
        code: 401,
        message: 'Invalid email or password',
        errors: 'Invalid email address'
      }
    }, status: :unauthorized
  end

  def invalid_password_response
    render json: {
      status: {
        code: 401,
        message: 'Invalid email or password',
        errors: 'Invalid password'
      }
    }, status: :unauthorized
  end

  def sign_in_success_response(user)
    render json: {
      status: {
        code: 200,
        message: 'User logged in successfully'
      },
      user: UserSerializer.new(user).serializable_hash[:data][:attributes],
      jwt: user.jwt
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user.nil?
      render json: {
        status: 200,
        message: 'User logged out successfully'
      }, status: :ok
    else
      render json: {
        status: 422,
        message: 'Something went wrong, session still active'
      }, status: :unprocessable_entity
    end
  end
end