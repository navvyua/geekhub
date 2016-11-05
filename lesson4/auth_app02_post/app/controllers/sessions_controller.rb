class SessionsController < ApplicationController
  before_action :authenticated_only, only: :destroy
  before_action :unauthenticated_only, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end