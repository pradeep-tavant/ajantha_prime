class VehiclesController < ApplicationController
  before_action :authenticate_member!
  before_action :set_vehicle, only: [:edit, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = params[:all].present? ? Vehicle.all : current_member.vehicles
  end

  # GET /vehicles/new
  def new
    @vehicle = current_member.vehicles.build
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to vehicles_path, notice: 'Vehicle entry was successfully added.'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path, notice: 'Vehicle entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
    redirect_to vehicles_url, notice: 'Vehicle entry was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:name, :number, :category, :member_id)
    end
end
