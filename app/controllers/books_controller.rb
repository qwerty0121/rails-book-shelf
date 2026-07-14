class BooksController < ApplicationController
  def index
    @books = Book.all()
    @book_count = @books.length
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  def new
  end
end
