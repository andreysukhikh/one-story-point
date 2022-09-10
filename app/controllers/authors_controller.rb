class AuthorsController < InheritedResources::Base
  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
  end

  private

  def author_params
    params.require(:author).permit(:fullname)
  end
end
