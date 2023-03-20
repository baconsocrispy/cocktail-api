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
    @show = true
    # updates user's default cabinet when 
    # switching liquor cabinets in the sidebar and
    # re-renders the sidebar with new cabinet
    if params[:update_id]
      current_user.update!(current_cabinet_id: params[:update_id])
      @cabinet = Cabinet.find(params[:update_id])
      render partial: 'components/cabinet_sidebar/cabinet_sidebar', locals: { cabinet: @cabinet }
    end
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
    p @cabinet
    render json: { message: 'TESTING'}

    # if @cabinet.save
    #   render json: @cabinet, status: :created, location: @cabinet
    # else
    #   render json: @cabinet.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /cabinets/1
  def update
    if @cabinet.update(cabinet_params)
      render json: @cabinet
    else
      render json: @cabinet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cabinets/1
  def destroy
    @cabinet.destroy
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