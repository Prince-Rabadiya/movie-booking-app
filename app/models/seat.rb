class Seat < ApplicationRecord
  has_and_belongs_to_many :bookings

  validates_presence_of :row, :column, :fare
end
