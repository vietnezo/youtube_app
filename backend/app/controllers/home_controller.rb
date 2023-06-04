class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:user).all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
