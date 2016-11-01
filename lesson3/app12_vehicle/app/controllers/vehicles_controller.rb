class VehiclesController < ApplicationController
  before_action :current_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    vehicle = Vehicle.new(vehicle_params)
    if vehicle.save
      redirect_to vehicle
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle
    else
      render :edit
    end
  end

  def destroy
    @vehicle.delete
    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:model)
  end

  def current_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end