# frozen_string_literal: true

class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :shows, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
