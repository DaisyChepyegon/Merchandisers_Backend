class OutletsController < ApplicationController
  before_action :set_outlet, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   # GET /outlets
   def index
    outlets = Outlet.all
 
     render json: outlets
   end
 
   # GET /outlets/1
   def show
     outlet = Outlet.find(params[:id])
       render json: outlet
   end
 
   # POST /outlets
   def create
    outlet = Outlet.create!(outlet_params)
    render json: outlet, status: :created
 
   end
 
   # PATCH/PUT /outlets/1
   def update
     outlet = set_outlet
       outlet.update!(outlet_params)
       render json:outlet
     
   end
 
   # DELETE /outlets/1
   def destroy
     outlet = set_outlet
       outlet.destroy
       head :no_content
    
   end
 
   private
     # Use callbacks to share common setup or constraints between actions.
     def set_outlet
      Outlet.find(params[:id])
     end
 
     # Only allow a list of trusted parameters through.
     def outlet_params
       params.require(:outlet).permit(:name, :location, :merchandiser_id, :route_plan_id)
     end

     def render_not_found_response
      render json: { error: "Outlet not found" }, status: :not_found
     end
end
