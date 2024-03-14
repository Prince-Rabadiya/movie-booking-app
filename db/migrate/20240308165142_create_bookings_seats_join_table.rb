# frozen_string_literal: true

# Create bookings seats join table
class CreateBookingsSeatsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :bookings, :seats
  end
end
