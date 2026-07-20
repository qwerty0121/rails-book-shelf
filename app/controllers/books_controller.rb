class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update ]

  def index
    @books = Book.all()
    @book_count = @books.length
  end

  def show
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

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_book
      @book = Book.find_by_id(params[:id])
    end

    def book_params
      params.expect(book: [ :title, :author_name, :read, :memo ])
    end
end
