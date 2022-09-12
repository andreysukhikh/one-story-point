class AuthorsController < InheritedResources::Base
  def show
    @author = Author.find(params[:id])
    @books = Book.where(author: @author)
  end

  private

  def author_params
    params.require(:author).permit(:fullname)
  end
end
