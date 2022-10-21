class RoutePlansController < ApplicationController
  before_action :set_route_plan, only: %i[ show update destroy ]

  # GET /route_plans
  def index
    @route_plans = RoutePlan.all

    render json: @route_plans
  end

  # GET /route_plans/1
  def show
    render json: @route_plan
  end

  # POST /route_plans
  def create
    @route_plan = RoutePlan.new(route_plan_params)

    if @route_plan.save
      render json: @route_plan, status: :created, location: @route_plan
    else
      render json: @route_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /route_plans/1
  def update
    if @route_plan.update(route_plan_params)
      render json: @route_plan
    else
      render json: @route_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /route_plans/1
  def destroy
    @route_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route_plan
      @route_plan = RoutePlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def route_plan_params
      params.require(:route_plan).permit(:name, :month, :manager_id)
    end
end
