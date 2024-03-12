# Movie Booking App

Welcome to the Movie Booking App repository! This web application is designed for theaters to manage movie bookings and ticket reservations. Built upon the Ruby on Rails framework, it offers a user-friendly interface for both administrators and customers.

## Features

- **Movie Listings**: View upcoming movie showtimes and available seats.
- **Booking Management**: Easily book tickets for desired movies and showtimes.
- **User Authentication**: Secure login system for customers and administrators.
- **Admin Dashboard**: Manage movies, showtimes, bookings, and user accounts.
<!-- - **Payment Integration**: Seamless payment processing for ticket reservations. -->

## Installation

To run this app locally, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine using the following command:
   ```
   git clone https://github.com/your-username/movie-booking-app.git
   ```

2. **Update Database Configuration**: Navigate to the `config` directory and update the `database.yml` file with your database credentials.

3. **Setup Database**: Run the following commands to create the database, run migrations, and seed initial data:
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the Server**: Finally, start the Rails server with the following command:
   ```
   rails server
   ```

5. **Access the Application**: Open your web browser and visit `http://localhost:3000` to access the Movie Booking App.

## Usage

- **Customer**: Browse movie listings, select showtimes, book tickets.
- **Admin**: Log in to the admin dashboard (`http://localhost:3000`) to manage movies, showtimes, bookings.

## Contributing

Contributions are welcome! If you encounter any bugs, issues, or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
