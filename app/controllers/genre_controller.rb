class GenresController < InheritedResources::Base

  private

  def book_params
    params.require(:genre).permit(:title)
  end

end
