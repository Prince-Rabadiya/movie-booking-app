class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.references :movie, null: false, foreign_key: true
      t.datetime :time
      t.integer :fare

      t.timestamps
    end
  end
end
