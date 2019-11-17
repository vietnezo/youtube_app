class HomeController < ApplicationController
  def index
    @movies = Movie.all.paginate(page: params[:page], per_page: 10)
  end
end
