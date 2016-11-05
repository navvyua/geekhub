class BooksController < ApplicationController
  before_action :authenticated_only
  before_action :current_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.delete
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end

  def current_book
    @book = Book.find(params[:id])
  end
end