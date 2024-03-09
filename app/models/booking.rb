class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_and_belongs_to_many :seats
end
