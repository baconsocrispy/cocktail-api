class CsrfController < ApplicationController
  include ActionController::RequestForgeryProtection
  
  def token
    csrf_token = request_forgery_protection_token

    render json: { token: csrf_token }
  end
end