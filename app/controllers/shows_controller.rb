class ShowsController < ApplicationController
  def index
    @shows = Show.all.includes(:movie)
  end

  def show
    @booking = Booking.new
    @show = Show.find(params[:id])
    @movie = @show.movie
    @seats = Seat.all
    @booked_seat_ids = @show.bookings.includes(:seats).map(&:seats).flatten.pluck(:id)
  end

  def new
    @show = Show.new
    @movies = Movie.all.map { |m| [m.name, m.id] }
  end

  def create
    @show = Show.new(show_params)
    if @show.save!
      redirect_to shows_path, notice: 'Show was successfully created.'
    else
      flash[:alert] = @show.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def show_params
    params.require(:show).permit(:time, :fare, :movie_id)
  end
end
