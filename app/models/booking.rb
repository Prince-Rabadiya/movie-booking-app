# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_and_belongs_to_many :seats

  validates_presence_of :total_fare
end
