class UsersController < ApplicationController
  before_action :authenticated_only,   only: :show
  before_action :unauthenticated_only, only: [:new, :create]

  before_action :current_resource,     only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_posts_path(@user)
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
