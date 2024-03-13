["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  Genre.find_or_create_by!(title: genre_name)
end

('A'..'Z').each do |row|
  (1..10).each do |column|
    Seat.find_or_create_by!(row: row, column: column, fare: column + 10)
  end
end

Genre.all.each do |genre|
  Movie.create!(name: "#{genre.title} Movie", genre_ids: [genre.id])
end

Movie.all.each_with_index do |movie, index|
  Show.find_or_create_by!(movie: movie, time: Time.now + 1.day + index.hours)
end

User.find_or_create_by!(email: "admin@gmail.com") do |user|
  user.first_name = "Admin"
  user.last_name = "User"
  user.password = "password"
  user.password_confirmation = "password"
  user.role = "admin"
end
