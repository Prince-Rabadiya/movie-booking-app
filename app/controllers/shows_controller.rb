# frozen_string_literal: true

class ShowsController < ApplicationController
  def index
    @shows = Show.all.includes(:movie).order(:start_time)
    authorize! :index, @shows
  end

  def show
    @booking = Booking.new
    @show = Show.find(params[:id])
    @movie = @show.movie
    @seats = Seat.all
    @booked_seat_ids = @show.bookings.includes(:seats).map(&:seats).flatten.pluck(:id)
    authorize! :read, @show
  end

  def new
    @show = Show.new
    @movies = Movie.all.map { |m| [m.name, m.id] }
    authorize! :create, @show
  end

  def create
    @show = Show.new(show_params)
    authorize! :create, @show
    if @show.save
      redirect_to shows_path, notice: 'Show was successfully created.'
    else
      flash[:alert] = @show.errors.full_messages.join(', ')
      redirect_to new_show_path
    end
  end

  private

  def show_params
    params.require(:show).permit(:start_time, :end_time, :movie_id)
  end
end
