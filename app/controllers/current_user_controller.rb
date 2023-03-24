class CurrentUserController < ApplicationController
  include AuthenticateUser
  before_action :authenticate_request!
  
  # get /current_user
  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
  end

  # post /favorite/:recipe_id
  def favorite
    recipe = Recipe.find(params[:recipe_id])
    if current_user.favorites.include?(recipe)
      current_user.favorites.delete(recipe)
      render json: { message: 'Unfavorited' }
    else
      current_user.favorites << recipe
      render json: { message: 'Favorited' }
    end
  end

  # post /update_current_cabinet/:id
  def update_current_cabinet
    cabinet_id = params[:id] == "null" ? nil : params[:id]
    current_user.update!(current_cabinet_id: cabinet_id)
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
  end
end
