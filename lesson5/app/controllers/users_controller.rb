class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  before_action :current_resource, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      user.create_profile
      session[:user_id] = user.id
      redirect_to user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def current_resource
    @user = User.find(params[:id])
  end
end
