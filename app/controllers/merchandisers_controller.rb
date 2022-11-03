class MerchandisersController < ApplicationController
  before_action :set_merchandiser, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   # GET /merchandisers
   def index

    merchandiser = Merchandiser.all

    render json: merchandiser

  end

  def gps
    merchandiser = Merchandiser.all

    render json: merchandiser
  end

  def show_gps
    merchandiser = set_merchandiser
    render json: merchandiser
  end

  # GET /merchandisers/1
  def show
    merchandiser = set_merchandiser
    render json: merchandiser
   
  end

  def show
    merchant = Merchandiser.create(location_params)
    render json: merchant, status: :created
  end


  
  def post_gps
    merchant = Merchandiser.create(location_params)
    render json: merchant, status: :created
  end

  def patch_gps
    merchant = Merchandiser.find_by(id: params[:id])
    merchant.update(latitude: merchandiser_gps_params[:latitude], longitude: merchandiser_gps_params[:longitude])
    render json: merchant,status: :ok
  end


  def create
    @user =Merchandiser.create!(merchandiser_params)
    token = encode_token({merchandiser_id: @user.id})
    render json: {merchandiser: @user, token: token}, status: :ok

  end



  # PATCH/PUT /merchandisers/1
  def update
    merchandiser = set_merchandiser
      merchandiser.update!(merchandiser_params)
      render json: merchandiser
    
  end

  # DELETE /merchandisers/1
  def destroy
    merchandiser = set_merchandiser
      merchandiser.destroy
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandiser
     Merchandiser.find(params[:id])
    end

   
    # Only allow a list of trusted parameters through.
    def merchandiser_params

      params.permit(:role, :email,  :password, :password_confirmation,  :username, :location, :image, :phone_number)
    end

    def location_params
      params.permit(:username, :longitude, :latitude)
    end


    def merchandiser_gps_params
      params.permit(:longitude, :latitude)
    end


    def render_not_found_response
      render json: { error: "Merchandiser not found" }, status: :not_found
     end
end
