class BooksController < InheritedResources::Base
  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
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
