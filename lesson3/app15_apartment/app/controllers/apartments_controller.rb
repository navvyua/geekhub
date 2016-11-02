class ApartmentsController < ApplicationController
  before_action :current_apartment, only: [:show, :edit, :update, :destroy]

  def index
    @apartments = Apartment.all
  end

  def show
  end

  def new
    @apartment = Apartment.new
  end

  def create
    apartment = Apartment.new(apartment_params)
    if apartment.save
      redirect_to apartment
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @apartment.update(apartment_params)
      redirect_to @apartment
    else
      render :edit
    end
  end

  def destroy
    @apartment.delete
    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit(:stage)
  end

  def current_apartment
    @apartment = Apartment.find(params[:id])
  end
end