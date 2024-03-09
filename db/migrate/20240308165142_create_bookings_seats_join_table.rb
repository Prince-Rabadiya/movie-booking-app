class CreateBookingsSeatsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :bookings, :seats
  end
end
