class AuthorsController < InheritedResources::Base

  private

  def author_params
    params.require(:author).permit(:fullname)
  end

end
