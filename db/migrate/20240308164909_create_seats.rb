class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.string :row
      t.integer :column

      t.timestamps
    end
  end
end
