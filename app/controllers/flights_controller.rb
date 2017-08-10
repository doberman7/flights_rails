class FlightsController < ApplicationController
  def index
    @fligths = Flight.all
  end
  def show
    p "-" * 50
    origen = params[:flow][:flight_origin]
    destino = params[:flow][:flight_destiny]
    @flight = Flight.where(origin: origen, destiny: destino)
    p "-" * 50
    #render 'index'
    #@flight = Flight.find(params[:id])
  end



  # def new
  #   @flight = Flight.new
  # end
  # def create
  #   @flights = Flight.all
  #   @flight = Flight.create(flight_params)
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
