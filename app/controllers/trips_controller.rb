class TripsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @trips = @user.trips
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

  def join
    @trip = Trip.find params[:id]
    @user = User.find params[:user_id]
    if @trip.driver.group_id == @user.group_id
      if @trip.seats > 0
        @trip.seats -= 1
        render json: 'User has joined the trip'
      else
        render json: 'Seats are full for this trip'
      end
    else
      render json: 'You are not in the same group'
    end
  end

  def leave

  end

  private
  def trip_params
    params.require(:trip).permit(:name, :departure_time, :seats)
  end
end
