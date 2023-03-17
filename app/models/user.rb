class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
    :recoverable, :validatable,
    :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :cabinets
  has_many :favorite_recipes
  has_many :favorites, through: :favorite_recipes, source: :recipe
  has_and_belongs_to_many :recipes

  # get a hash of ingredient ids from a user's cabinet
  def ingredients
    c = Cabinet.find(self.default_cabinet)
    ingredient_ids = []
    c.ingredients.each { |i| ingredient_ids << i.id }
    return ingredient_ids
  end

  # return user's jwt
  def jwt
    return JWT.encode(
      { user_id: self.id }, Rails.application.secrets.secret_key_base
    )
  end
end