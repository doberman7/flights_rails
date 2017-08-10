require 'date'

User.create!(name: "uno", admin: false, email: "uno@hotmail.com")

Booking.create!(total: 120.09, flight_id: 1)
Booking.create!(total: 120.09, flight_id: 1)

UserBooking.create!(user_id: 1, booking_id: 1)
UserBooking.create!(user_id: 1, booking_id: 2)

Flight.create!(seats: 20, destiny: "hawai", origin: "russia", date: Date.new(2001,2,3), time: Time.now, cost: 120.09)

#User.first.bookings.first.flight.origin => ir al vuelo del primer usuario

#User.first.bookings.first.flight.date => Sat, 03 Feb 2001

#Flight.first.bookings.first.users.first => del primer vuelo, la primera reservacion, de los usarios ver primer usuario
