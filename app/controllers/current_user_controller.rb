class CurrentUserController < ApplicationController
  # get /current_user
  def index
    if !decoded_token.empty?
      user_id = decoded_token.first['user_id']
      current_user = User.find_by(id: user_id)
      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    end
  end

  # post /favorite/:recipe_id
  def favorite
    if !decoded_token.empty?
      user_id = decoded_token.first['user_id']
      current_user = User.find(user_id)
      recipe = Recipe.find(params[:recipe_id])

      if current_user.favorites.include?(recipe)
        current_user.favorites.delete(recipe)
        render json: { message: 'Unfavorited' }
      else
        current_user.favorites << recipe
        render json: { message: 'Favorited' }
      end
    end
  end

  # post /update_current_cabinet/:id
  def update_current_cabinet
    if !decoded_token.empty?
      user_id = decoded_token.first['user_id']
      current_user = User.find_by(id: user_id)

      cabinet_id = params[:id] == "null" ? nil : params[:id]
      current_user.update!(current_cabinet_id: cabinet_id)

      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    end
  end

  # helpers
  private
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
