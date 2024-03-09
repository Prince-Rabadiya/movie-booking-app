class MoviesController < ApplicationController
  def index
    @movies = Movie.all.includes(:genres)
  end

  def show
    @movie = Movie.find(params[:id])
    @shows = @movie.shows
  end

  def new 
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save!
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      flash[:alert] = @movie.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, genre_ids: [])
  end
end
