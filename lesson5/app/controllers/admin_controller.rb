class AdminController < ApplicationController
  private

  def admin_only
    redirect_to current_user unless current_user.admin
  end
end
