class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
    @ingredient_types = Ingredient.distinct.pluck(:type).reverse

    render json: { 
      ingredients: @ingredients.map { |ingredient| 
        IngredientSerializer.new(ingredient)
          .serializable_hash[:data][:attributes]
      }, 
      ingredientTypes: @ingredient_types 
    }
  end

  # GET /ingredients/1
  def show
    render json: @ingredient
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient, status: :created, location: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.fetch(:ingredient, {})
    end
end
