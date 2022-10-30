class RoutePlansController < ApplicationController
  before_action :set_route_plan, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   # GET /route_plans
   def index
    route_plans = RoutePlan.all
    render json:route_plans
   end
 
   # GET /route_plans/1
   def show
     route_plan = set_route_plan
      render json: route_plan
   end
 
   # POST /route_plans
   def create

    route_plan = RoutePlan.create!(route_plan_params)

    render json:route_plan, status: :created

   end
 
   # PATCH/PUT /route_plans/1
   def update
    route_plan = set_route_plan
    route_plan.update!(route_plan_params)
    render json:route_plan
   end
 
   # DELETE /route_plans/1
   def destroy
    route_plan = set_route_plan
    route_plan.destroy
    head :no_content
   end
 
   private
     # Use callbacks to share common setup or constraints between actions.
     def set_route_plan
       RoutePlan.find(params[:id])
     end
 
     # Only allow a list of trusted parameters through.
     def route_plan_params
       params.permit(:route_name, :merchandiser, :outlets, :location, :time)
     end

     def render_not_found_response
      render json: { error: "Routeplan not found" }, status: :not_found
     end
end
