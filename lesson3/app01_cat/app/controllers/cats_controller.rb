class CatsController < ApplicationController
  before_action :current_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      redirect_to cat
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat
    else
      render :edit
    end
  end

  def destroy
    @cat.delete
    redirect_to cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name)
  end

  def current_cat
    @cat = Cat.find(params[:id])
  end
end