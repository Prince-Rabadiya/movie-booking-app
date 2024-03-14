# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.includes(:genres)
    authorize! :index, Movie
  end

  def show
    @movie = Movie.find(params[:id])
    @shows = @movie.shows
    authorize! :read, @movie
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
    authorize! :create, @movie
  end

  def create
    @movie = Movie.new(movie_params)
    authorize! :create, @movie
    if @movie.save
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      @genres = Genre.all
      flash[:alert] = @movie.errors.full_messages.join(', ')
      redirect_to new_movie_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, genre_ids: [])
  end
end
