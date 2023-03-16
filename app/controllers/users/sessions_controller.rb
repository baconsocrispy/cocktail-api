# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def current_user
    if current_user
      render json: {
        status: {
          code: 200
        },
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        message: 'No user is currently signed in'
      }
    end
  end

  # override default devise create method
  def create
    # find user by email
    @user = User.find_by(email: sign_in_params[:email])

    return invalid_email_response unless @user

    # verify password and log in user
    if @user.valid_password?(sign_in_params[:password])
      sign_in :user, @user
      return sign_in_success_response(@user)
    else
      return invalid_password_response
    end
  end

  private
  def sign_in_params
    params.require(:user).permit :email, :password
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
      data: UserSerializer.new(user).serializable_hash[:data][:attributes]
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
