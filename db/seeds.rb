require 'date'

#FORMAT TIME:     gm(year, month, day, hour, min) → time
hawai = Flight.create!(total_seats: 20, destiny: "Hawai", origin: "Moscu",  time: Time.gm(2000,"jan",1,20,15) , cost: 120.09)
moscu = Flight.create!(total_seats: 20, destiny: "Moscu", origin: "Hawai",  time: Time.gm(2000,"jan",2,20,15) , cost: 120.09)
baghdad = Flight.create!(total_seats: 40, destiny: "Baghdad", origin: "Siberia",  time: Time.gm(2000,"jan",1,14,15) , cost: 120.09)
siberia = Flight.create!(total_seats: 40, destiny: "Baghdad", origin: "Siberia",  time: Time.gm(2000,"jan",2,14,15) , cost: 120.09)

paco = User.create!(name: "Paco", admin: true, email: "uno@hotmail.com")
poncho = User.create!(name: "Poncho", admin: false, email: "dos@hotmail.com")

reservacion_hawai_uno = Booking.create!(total_cost: hawai.cost, flight_id: hawai.id)
reservacion_hawai_dos = Booking.create!(total_cost: hawai.cost, flight_id: hawai.id)
reservacion_moscu = Booking.create!(total_cost: moscu.id, flight_id: moscu.id)
reservacion_baghdad = Booking.create!(total_cost: baghdad.id, flight_id: baghdad.id)
reservacion_siberia = Booking.create!(total_cost: siberia.id, flight_id: siberia.id)

UserBooking.create!(user_id: paco.id, booking_id: reservacion_hawai_uno.id)
UserBooking.create!(user_id: poncho.id, booking_id: reservacion_hawai_dos.id)
UserBooking.create!(user_id: paco.id, booking_id: reservacion_moscu.id)
UserBooking.create!(user_id: paco.id, booking_id: reservacion_baghdad.id)
UserBooking.create!(user_id: paco.id, booking_id: reservacion_siberia.id)
#User.find(2).bookings.first.flight.destiny
#=> ir al vuelo del segundo usuario, ver destino

#User.first.bookings.first.flight.origin
#=> ir al vuelo del primer usuario

#User.first.bookings.first.flight.time
#=> 2000-01-01 20:15:00

#Flight.first.bookings.first.users.first
#=> del primer vuelo, la primera reservacion, de los usarios ver primer usuario

#Flight.first.bookings.find(2).users.name
#=> del primer vuelo, la segunda reservacion, de los usarios ver nombre
