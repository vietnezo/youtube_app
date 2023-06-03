class MoviesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = current_user.movies.new
  end

  def create
    movie_info = VideoInfo.new(movie_params[:url])
    @movie = current_user.movies.new(movie_params.merge(title: movie_info&.title, description: movie_info&.description))

    respond_to do |format|
      if @movie.save
        format.html { redirect_to root_path, notice: "Share movie successfully." }
        format.json { render :edit, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url)
  end
end
