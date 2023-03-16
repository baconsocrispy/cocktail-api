# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  private
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: {
          code: 200,
          message: 'Signup success'
        },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        message: "#{
          resource.errors.full_messages.to_sentence
        }",
        errors: resource.errors
      }, status: :unprocessable_entity  
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
