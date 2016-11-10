class PagesController < ApplicationController
  before_action :authenticated_only
  before_action :current_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    page = Page.new(page_params)
    if page.save
      redirect_to page
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to @page
    else
      render :edit
    end
  end

  def destroy
    @page.delete
    redirect_to pages_path
  end

  private

  def current_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title)
  end
end