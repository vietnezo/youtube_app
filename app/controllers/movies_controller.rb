class MoviesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.new(movie_params)

    respond_to do |format|
      if @movie.save
        movie_info = VideoInfo.new(movie_params[:url])
        @movie.update_attributes(title: movie_info&.title, description: movie_info&.description)

        format.html { redirect_to root_path, notice: "Share move successfully!" }
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
