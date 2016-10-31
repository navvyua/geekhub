class ShirtsController < ApplicationController
  before_action :current_shirt, only: [:show, :edit, :update, :destroy]

  def index
    @shirts = Shirt.all
  end

  def show
  end

  def new
    @shirt = Shirt.new
  end

  def create
    shirt = Shirt.new(shirt_params)
    if shirt.save
      redirect_to shirt
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shirt.update(shirt_params)
      redirect_to @shirt
    else
      render :edit
    end
  end

  def destroy
    @shirt.delete
    redirect_to shirts_path
  end

  private

  def shirt_params
    params.require(:shirt).permit(:color)
  end

  def current_shirt
    @shirt = Shirt.find(params[:id])
  end
end