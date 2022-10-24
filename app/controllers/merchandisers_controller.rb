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
   merchandiser = Merchandiser.create(merchandiser_params)
    if merchandiser.valid?
        create_merchandiser_session(merchandiser.id)
        app_response(status_code: 201, message: "Account created successfully", body:merchandiser)
    else
        app_response(status_code: 422, message: "Invalid input", body:merchandiser.errors.full_messages)
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

    def create_merchandiser_session(merchandiser.id)
      session[:merchandiser_id] ||= merchandiser_id
    end

    # Only allow a list of trusted parameters through.
    def merchandiser_params

      params.require(:merchandiser).permit(:username, :email,  :password, :password_confirmation)
    end

    def render_not_found_response
      render json: { error: "Merchandiser not found" }, status: :not_found
     end
end
