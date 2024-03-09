class CreateMoviesGenresJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :movies, :genres
  end
end
