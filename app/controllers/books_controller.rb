class BooksController < ApplicationController
  def index
    @books = Book.all()
    @book_count = @books.length
  end
end
