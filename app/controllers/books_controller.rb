class BooksController < InheritedResources::Base
  before_action :get_authors, only: [:new, :create, :edit, :update]
  before_action :get_genres, only: [:new, :create, :edit, :update]

  def index
    @books = Book.includes(:author, :genre)
  end

  private

  def get_authors
    @authors = Author.all
  end

  def get_genres
    @genres = Genre.all
  end

  def book_params
    params.require(:book).permit(:name, :description, :shelf, :author_id, :genre_id)
  end

end
