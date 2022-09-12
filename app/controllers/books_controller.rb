class BooksController < InheritedResources::Base
  def index
    @books = Book.includes(:author, :genre)
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
  end

  def create
    @book = Book.new(book_params)
    @authors = Author.all
    @genres = Genre.all

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
    @genres = Genre.all
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :shelf, :author_id, :genre_id)
  end

end
