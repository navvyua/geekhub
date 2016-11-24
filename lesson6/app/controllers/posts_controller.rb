class PostsController < ApplicationController
  before_action :authenticated_only

  before_action :current_resource_owner
  before_action :current_resource, only: [:show, :edit, :update, :destroy]

  before_action :author_only

  def index
    @posts = @user.posts.paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to [@user, @post]
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to [@user, @post]
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image, :category_ids)
  end

  def current_resource
    @post = @user.posts.find(params[:id])
  end

  def current_resource_owner
    @user = User.find(params[:user_id])
  end

  def author_only
    redirect_to user_posts_path(current_user) unless current_user == @user
  end
end
