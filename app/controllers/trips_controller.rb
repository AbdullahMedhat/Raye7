class TripsController < ApplicationController
  def index
    @trips = Trip.all
    render json: @trips
  end

  def update
    @trip = Trip.find params[:id]
    @trip.update! trip_params
    render json: @trip
  end

  def create
    @trip = Trip.new trip_params
    @trip.save!
    render json: @trip
  end

  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy!
    render json: @trip
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :departure_time, :seats)
  end
end
