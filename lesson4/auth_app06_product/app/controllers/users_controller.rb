class UsersController < ApplicationController
  before_action :authenticated_only,   only: :show
  before_action :unauthenticated_only, only: [:new, :create]

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

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
