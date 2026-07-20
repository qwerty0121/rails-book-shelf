class BooksController < ApplicationController
  def index
    @books = Book.all()
    @book_count = @books.length
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def book_params
      params.expect(book: [ :title, :author_name, :read, :memo ])
    end
end
