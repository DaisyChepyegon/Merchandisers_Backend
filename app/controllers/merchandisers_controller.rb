class MerchandisersController < ApplicationController
  before_action :set_merchandiser, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   # GET /merchandisers
   def index
    merchandiser = Merchandiser.all

    render json: merchandiser
  end

  # GET /merchandisers/1
  def show
    merchandiser = set_merchandiser
    render json: merchandiser
   
  end

  # POST /merchandisers
  def create

    merchandiser = Merchandiser.create!(merchandiser_params)
    # render json: merchandiser, status: :created
    if  merchandiser.valid?
        session[:admin_id] =  merchandiser.id
        render json: {
            status: :created,
            merchandiser: merchandiser
        }
    else
        render json: {
            status: 500,
            errors: merchandiser.errors.full_messages
        }
    end
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
      params.require(:merchandiser).permit(:username, :email,  :password_digest, :phone_number, :user_id, :password_confirmation,:image, :location, :route_plan_id)
    end

    def render_not_found_response
      render json: { error: "Merchandiser not found" }, status: :not_found
     end
end
