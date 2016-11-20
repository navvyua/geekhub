class Admin::UsersController < AdminController
  before_action :admin_only
  before_action :current_resource, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def update
    @user.update(admin: params[:admin])
    redirect_to admin_users_path
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def current_resource
    @user = User.find(params[:id])
  end
end
