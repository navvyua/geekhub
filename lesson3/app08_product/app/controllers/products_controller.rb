class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.delete
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:model)
  end

  def current_product
    @product = Product.find(params[:id])
  end
end