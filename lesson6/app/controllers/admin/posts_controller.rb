class Admin::PostsController < AdminController
  before_action :authenticated_only
  before_action :admin_only

  def index
    @posts = Post.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end