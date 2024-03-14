# frozen_string_literal: true

class BookingsController < ApplicationController
  def index
    @bookings = if current_user.admin?
                  Booking.includes(:seats, :user, show: [:movie])
                else
                  Booking.where(user_id: current_user.id).includes(:seats, show: [:movie])
                end
  end

  def show
    @booking = Booking.find(params[:id])
    @seats = @booking.seats
    @show = @booking.show
    @movie = @show.movie
    @user = @booking.user if current_user.admin?
  end

  def create
    total_fare = Seat.where(id: booking_params[:seat_ids]).pluck(:fare).sum
    @booking = Booking.new(booking_params.merge({ total_fare: }))
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      flash[:alert] = @booking.errors.full_messages.join(', ')
      redirect_to show_path(@booking.show_id)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :show_id, seat_ids: [])
  end
end
