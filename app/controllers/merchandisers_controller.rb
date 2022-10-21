class MerchandisersController < ApplicationController
  before_action :set_merchandiser, only: %i[ show update destroy ]

  # GET /merchandisers
  def index
    @merchandisers = Merchandiser.all

    render json: @merchandisers
  end

  # GET /merchandisers/1
  def show
    render json: @merchandiser
  end

  # POST /merchandisers
  def create
    @merchandiser = Merchandiser.new(merchandiser_params)

    if @merchandiser.save
      render json: @merchandiser, status: :created, location: @merchandiser
    else
      render json: @merchandiser.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /merchandisers/1
  def update
    if @merchandiser.update(merchandiser_params)
      render json: @merchandiser
    else
      render json: @merchandiser.errors, status: :unprocessable_entity
    end
  end

  # DELETE /merchandisers/1
  def destroy
    @merchandiser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandiser
      @merchandiser = Merchandiser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def merchandiser_params
      params.require(:merchandiser).permit(:username, :image, :phone_number, :email, :password_digest, :location, :route_plan_id)
    end
end
