class RecipesController < ApplicationController
  include AuthenticateUser
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def search
    @page = params[:page] || 1
    @sort_option = params[:sortOption]

    case @sort_option
    when 'All Recipes', nil
      @recipes = Recipe.search_all_recipes(params).alphabetical.page(@page)
    when 'I Have All Ingredients'
      @recipes = Recipe.match_all_ingredients(params).alphabetical.page(@page)
    when 'I Have Any Ingredient'
      @recipes = Recipe.match_any_ingredient(params).alphabetical.page(@page)
    when 'Favorites'
      @recipes = current_user.favorites.search_all_recipes(params).alphabetical.page(@page)
    else
      @recipes = Recipe.search_all_recipes(params).alphabetical.page(@page)
    end
    
    @recipes_count = @recipes.total_count

    render json: { 
      recipes: @recipes.map { |recipe| 
        RecipeSerializer.new(recipe).serializable_hash[:data][:attributes]
      }, 
      recipeCount: @recipes_count 
    }
  end

  def index
    @page = params[:page] || 1
    @recipes = Recipe.alphabetical.page(@page)
    @recipes_count = @recipes.total_count

    render json: { 
      recipes: @recipes.map {|recipe| 
        RecipeSerializer.new(recipe).serializable_hash[:data][:attributes]
      }, 
      recipeCount: @recipes_count 
    }
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    respond_to do |format|
      begin 
        @recipe.save!
        @recipe.users << current_user
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      rescue ActiveRecord::RecordNotUnique => e
        flash[:error] = "Recipe name already in use"
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      rescue => e
        flash[:error] = e.message
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.portions.destroy_all
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find_by_slug!(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      # need to explicitly include :id for :steps/:portions for :_destroy to work
      params.require(:recipe).permit(
        :name, 
        :description, 
        category_ids: [], 
        tool_ids: [],                           
        steps_attributes: [
          :id,
          :ingredient_id,
          :name,
          :description,
          :_destroy
        ],
        portions_attributes: [
          :id,
          :ingredient_id,
          :amount,
          :unit,
          :portionable_type,
          :portionable_id,
          :optional,
          :_destroy
        ]
      )       
    end
end
