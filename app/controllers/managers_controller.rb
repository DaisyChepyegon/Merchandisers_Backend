class ManagersController < ApplicationController
  before_action :set_manager, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /managers
  def index
    managers = Manager.all

    render json: managers
  end

  # GET /managers/1
  def show
    manager = set_manager
    render json: manager
  end

  # POST /managers
  # def create
  #   manager = Manager.create!(manager_params)
  #   render json: manager, status: :created

  # end

  def create
    @user = Manager.create!(manager_params)
    token = encode_token({manager_id: @user.id})
    render json: {manager: @user, token: token}, status: :ok
    # render json: @user, status: :created, location: @user
   
  end

  # PATCH/PUT /managers/1
  def update
    manager = set_manager
    manager.update!(manager_params)
    render json: manager
  end

  # DELETE /managers/1
  def destroy
    manager = set_manager
    manager.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      Manager.find(params[:id])
    end

    

    # Only allow a list of trusted parameters through.
    def manager_params
      params.permit(:role, :email,  :password, :password_confirmation)
    end

    def render_not_found_response
      render json: { error: "Manager not found" }, status: :not_found
    end
end
