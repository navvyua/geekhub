class CartsController < ApplicationController
  before_action :current_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    cart = Cart.new(cart_params)
    if cart.save
      redirect_to cart
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cart.update(cart_params)
      redirect_to @cart
    else
      render :edit
    end
  end

  def destroy
    @cart.delete
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:item)
  end

  def current_cart
    @cart = Cart.find(params[:id])
  end
end