class TreesController < ApplicationController
  before_action :current_tree, only: [:show, :edit, :update, :destroy]

  def index
    @trees = Tree.all
  end

  def show
  end

  def new
    @tree = Tree.new
  end

  def create
    tree = Tree.new(tree_params)
    if tree.save
      redirect_to tree
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tree.update(tree_params)
      redirect_to @tree
    else
      render :edit
    end
  end

  def destroy
    @tree.delete
    redirect_to trees_path
  end

  private

  def tree_params
    params.require(:tree).permit(:name)
  end

  def current_tree
    @tree = Tree.find(params[:id])
  end
end