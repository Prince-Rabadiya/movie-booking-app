# frozen_string_literal: true

# Create bookings
class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.integer :total_fare, null: false, default: 0

      t.timestamps
    end
  end
end
