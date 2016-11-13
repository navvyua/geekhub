class ProfilesController < ApplicationController
  before_action :current_user_resource
  before_action :current_resource

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to [@user, @profile]
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :gender, :birthday)
  end

  def current_resource
    @profile = @user.profile
  end

  def current_user_resource
    @user = User.find(params[:user_id])
  end
end
