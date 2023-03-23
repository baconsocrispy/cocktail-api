class CabinetsController < ApplicationController
  before_action :set_cabinet, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!

  def cabinet_ingredients
    cabinet = Cabinet.find(params[:id])
    ingredients = cabinet.ingredients

    render json: { 
      ingredients: ingredients.map { |ingredient| 
        IngredientSerializer.new(ingredient)
          .serializable_hash[:data][:attributes]
      }
    }
  end

  # GET /cabinets
  def index
    # @cabinets = Cabinet.where(user_id: current_user.id)
    @cabinets = Cabinet.all
    render json: @cabinets
  end

  # GET /cabinets/1
  def show
    render json: CabinetSerializer.new(@cabinet).serializable_hash[:data][:attributes]
  end

  # GET /cabinets/new
  def new
    # obtains ingredient type and returns it in a json for new cabinet form
    if params[:ingredientId]
      @ingredientType = Ingredient.find(params[:ingredientId]).type
      respond_to do |format|
        format.json { render json: { ingredientType: @ingredientType }}
      end
    end

    @cabinet = Cabinet.new
    @cabinet.portions.build
  end

  # GET /cabinets/1/edit
  def edit
    set_cabinet
    @cabinet.portions.build
    @edit = true
  end

  # POST /cabinets
  def create
    @cabinet = Cabinet.create!(cabinet_params)

    if @cabinet.errors.any?
      render json: {
        status: {
          code: 422,
          errors: @cabinet.errors
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          code: 200,
          message: 'Cabinet created successfully'
        }
      }, status: :ok
    end
  end

  # PATCH/PUT /cabinets/1
  def update
    @cabinet.portions.destroy_all
    @cabinet.tools.destroy_all
    @cabinet.update!(cabinet_params)
    
    if @cabinet.errors.any?
      render json: {
        status: {
          code: 422,
          errors: @cabinet.errors
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          code: 200,
          message: 'Cabinet updated successfully'
        }
      }, status: :ok
    end
  end

  # DELETE /cabinets/1
  def destroy
    @cabinet.destroy!
    render json: { message: 'Successfully deleted cabinet' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cabinet
      @cabinet = Cabinet.find_by_slug!(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cabinet_params
      params.require(:cabinet).permit(:name, 
        :private, 
        :user_id, 
        tool_ids: [],
        portions_attributes: [:id,
          :ingredient_id,
          :amount,
          :unit,
          :portionable_type,
          :portionable_id,
          :_destroy
        ]
      )
    end
end