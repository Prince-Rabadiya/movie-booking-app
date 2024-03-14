# frozen_string_literal: true

# Create genres
class CreateGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :genres do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
