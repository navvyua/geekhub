class PicturesController < ApplicationController
  before_action :current_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new(picture_params)
    if picture.save
      redirect_to picture
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture
    else
      render :edit
    end
  end

  def destroy
    @picture.delete
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:url)
  end

  def current_picture
    @picture = Picture.find(params[:id])
  end
end