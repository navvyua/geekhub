class PostsController < ApplicationController
  before_action :authenticated_only
  before_action :current_user_resource
  before_action :current_resource, only: [:show, :edit, :update, :destroy]
  before_action :owner_or_admin_only

  def index
    @posts = @user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to [@user, @post]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to [@user, @post]
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end

  def current_resource
    @post = @user.posts.find(params[:id])
  end

  def current_user_resource
    @user = User.find(params[:user_id])
  end

  def owner_or_admin_only
    redirect_to user_posts_path(current_user) unless current_user == @user
  end
end