# frozen_string_literal: true

class GenresController < ApplicationController
  def index
    @genres = Genre.all
    authorize! :index, @genres
  end

  def new
    @genre = Genre.new
    authorize! :read, @genre
  end

  def create
    @genre = Genre.new(genre_params)
    atuhorize! :create, @genre
    if @genre.save
      redirect_to genres_path, notice: 'Genre was successfully created.'
    else
      flash[:alert] = @genre.errors.full_messages.join(', ')
      redirect_to new_genre_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:title, :description)
  end
end
