# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :movie
  has_many :bookings, dependent: :destroy

  validates_presence_of :start_time, :end_time, :movie_id
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    return unless end_time <= start_time

    errors.add(:end_time, 'must be after the start time')
  end
end
