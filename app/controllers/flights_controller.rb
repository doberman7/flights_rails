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
    p @flights
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

    end
    p "´" * 50
  end
  def select_fly
    p "." * 50
    p "SELECT FLY"
    p @flight_seleceted = Flight.find_by(id: params[:flight_id])
    p params
    p "." * 50
  end
  def user_new
    p "-" * 50
    p "USER NEW"
    p params
    p "-" * 50
  end

  def passengers
    p "°" * 50
    p "PAssENGERS"
    p params
    @user = User.new
    @users = Array.new(params[:seats][:seats_selected].to_i)
    @users.each_index {|i| @users[i] = User.new}
    p "°" * 50
  end

  # def create
  #   @flights = Flight.all
  #   origen = params[:flow][:flight_origin]
  #   destino = params[:flow][:flight_destiny]
  #   p "-" * 50
  #   p @flight = Flight.where(origin: origen, destiny: destino)
  #   p "-" * 50
  # end
  # def edit
  #   @flight = Flight.find(params[:id])
  # end
  #
  # def update
  #   @flights = Flight.all
  #   @flight = Flight.find(params[:id])
  #
  #   @flight.update_attributes(flight_params)
  # end
  #
  # def delete
  #   @flight = Flight.find(params[:flight_id])
  # end
  #
  # def destroy
  #   @flights = Flight.all
  #   @flight = Flight.find(params[:id])
  #   @flight.destroy
  # end

  private
    def flight_params
      params.require(:flight).permit(:total_seats, :destiny, :origin, :depart, :cost)
    end
end
