class Show < ApplicationRecord
  belongs_to :movie
  has_many :bookings, dependent: :destroy

  validates_presence_of :time, :fare, :movie_id
end
