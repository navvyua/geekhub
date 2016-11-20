class AdminController < ApplicationController
  private

  def admin_only
    redirect_to user_posts_path(current_user) unless current_user.admin
  end
end
