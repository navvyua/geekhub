class PostsController < ApplicationController
  before_action :require_user
  before_action :current_user_resource
  before_action :current_resource, only: [:show, :edit, :update, :destroy]
  before_action :require_owner

  def index
    @posts = @user.posts.paginate(page: params[:page])
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      pry
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

  def current_user_resource
    @user = User.find(params[:user_id])
  end

  def require_owner
    redirect_to root_path unless current_user == @user
  end
end
