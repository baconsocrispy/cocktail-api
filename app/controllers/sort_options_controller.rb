class SortOptionsController < ApplicationController
  before_action :set_sort_option, only: %i[ show update destroy ]

  # GET /sort_options
  def index
    @sort_options = SortOption.all

    render json: { sortOptions: @sort_options.map { |sort_option| 
      SortOptionSerializer.new(sort_option)
        .serializable_hash[:data][:attributes]
    }}
  end

  # GET /sort_options/1
  def show
    render json: @sort_option
  end

  # POST /sort_options
  def create
    @sort_option = SortOption.new(sort_option_params)

    if @sort_option.save
      render json: @sort_option, status: :created, location: @sort_option
    else
      render json: @sort_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sort_options/1
  def update
    if @sort_option.update(sort_option_params)
      render json: @sort_option
    else
      render json: @sort_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sort_options/1
  def destroy
    @sort_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sort_option
      @sort_option = SortOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sort_option_params
      params.fetch(:sort_option, {})
    end
end
