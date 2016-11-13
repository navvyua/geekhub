class UsersController < ApplicationController
  before_action :authenticated_only, except: [:new, :create]
  before_action :unauthenticated_only, only: [:new, :create]
  before_action :current_resource, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def current_resource
    @user = User.find(params[:id])
  end
end