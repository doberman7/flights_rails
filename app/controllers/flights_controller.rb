class FlightsController < ApplicationController
  def index
    @fligths = Flight.all
  end

  def show
    p "´" * 50
    origen = params[:flow][:flight_origin]
    destino = params[:flow][:flight_destiny]
    año_selected = params[:calendar]["date(1i)"]
    mes_selected = params[:calendar]["date(2i)"]
    dia_selected = params[:calendar]["date(3i)"]
    seats_selected = params[:flow][:seats_selected].to_i
    flights = []
    @flights = Flight.where(origin: origen, destiny: destino, total_seats: (seats_selected..40)).each do |flight|
       flights << flight
    end

    if @flights.empty?
      @no_vuelos = "Reinicia la busqueda"
    else
      #p "-" * 50
      flights.delete_if do |flight|
         año_selected.to_i != flight.depart.year
         mes_selected.to_i != flight.depart.month
         dia_selected.to_i != flight.depart.day
        #p "Año seleccionado #{año_selected.to_i} en igual a Año de vuelo #{ flight.depart.year}: #{año_selected.to_i == flight.depart.year}"
      end
       @flights = flights
       @seats_selected = seats_selected
    end
    p "´" * 50
  end

  def select_fly
    p "." * 50
    p "SELECT FLY"
    @seats_selected = params[:seats_selected]
    @flight_seleceted = Flight.find_by(id: params[:flight_id])
    $seats = @seats_selected.to_i
    $flight =  @flight_seleceted
    @booking = Booking.create!( flight_id: @flight_seleceted.id)
    p "." * 50
  end

  def user_add
    p "-" * 50
    p "USER_ADD"
    p params
    @user = User.new
    p "-" * 50
  end

 def user_new
  p"<" * 50
  p "USER_NEW"
   @user = User.create!(name: params[:user][:name], email: params[:user][:email])
   @user_booking = UserBooking.create!(user_id: @user.id, booking_id: Booking.last.id)
   @booking_users =  Booking.last.users
  # p params
  p"<" * 50
 end

 def pay
   p"<" * 50
   p "PAY"
   @user_admin = User.new
   p $seats
   p $flight
   p"<" * 50
 end


  private
    def flight_params
      params.require(:flight).permit(:total_seats, :destiny, :origin, :depart, :cost)
    end
end
