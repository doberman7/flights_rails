class FlightsController < ApplicationController
  def index
    @fligths = Flight.all
  end
  def show
    origen = params[:flow][:flight_origin]
    destino = params[:flow][:flight_destiny]
    @flights = Flight.where(origin: origen, destiny: destino)

    if @flights.empty?
      @no_vuelos = "Reinicia la busqueda"
    else
      p "HAY #{@flights.count} vuelos que coinsiden"
      p "DESTINO #{@flights.first.destiny} "
      p "ORIGEN #{@flights.first.origin} "
      p "-" * 50
    end
  end
  def create_user
    @user = User.new
  end



  # def new
  #   @flight = Flight.new
  # end
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
      params.require(:flight).permit(:total_seats, :destiny, :origin, :time, :cost)
    end
end
