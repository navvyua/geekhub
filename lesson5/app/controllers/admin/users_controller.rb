class Admin::UsersController < AdminController
  before_action :current_user, only: [:update, :destroy]

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

  def current_user
    @user ||= User.find(params[:id]) if params[:id]
  end
end
