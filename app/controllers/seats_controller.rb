class SeatsController < ApplicationController
  def index
    @seats = Seat.all
  end

  def new
    @seat = Seat.new
  end

  def create
    @seat = Seat.new(seat_params)
    if @seat.save
      redirect_to seats_path, notice: 'Seat was successfully created.'
    else
      flash[:alert] = @seat.errors.full_messages.join(", ")
      redirect_to new_seat_path
    end
  end

  private

  def seat_params
    params.require(:seat).permit(:row, :column, :fare)
  end
end
