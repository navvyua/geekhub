class BoatsController < ApplicationController
  before_action :current_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat =  Boat.new
  end

  def create
    boat = Boat.new(boat_params)
    if boat.save
      redirect_to boat
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to @boat
    else
      render :edit
    end
  end

  def destroy
    @boat.delete
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:model)
  end

  def current_boat
    @boat = Boat.find(params[:id])
  end
end