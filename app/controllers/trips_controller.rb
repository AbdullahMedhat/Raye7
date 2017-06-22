class TripsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @group = @user.group
    render json: @group.trips.to_json(:include => [:source, :destination])
  end

  def show
    @trip = Trip.find params[:id]
    render json: @trip.to_json(:include =>[:users])
  end

  def update
    @trip = Trip.find params[:id]
    @trip.update! trip_params
    render json: @trip
  end

  def create
    @trip = Trip.new trip_params
    @user = User.find params[:driver_id]

    @trip.group_id = @user.group_id
    @user.trip_id = @trip.id

    @trip.save!
    @user.save!
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
        @trip.save!
        @user.trip_id = @trip.id
        @user.save!
        @guest = Guest.new(user_id: "#{@user.id}", trip_id: "#{@trip.id}")
        @guest.save!
        render json: @guest
      else
        render json: 'Seats are full for this trip'
      end
    else
      render json: 'You are not in the same group'
    end
  end

  def leave
    @trip = Trip.find params[:id]
    @user = User.find params[:user_id]
    @guest = Guest.where(:user_id => @user, :trip_id => @trip)
    if @guest.nil?
      render json: 'Sorry, you are not joined this trip before'
    else
      render json: @guest
      Guest.destroy(@guest.ids)
      @trip.seats += 1
      @trip.save
    end
  end

  def destroy
    @trip = Trip.where(:user_id => params[:id]) 
    
    #delete all guest who joined this trip
    Guest.delete_all(trip_id: @trip.id)

    #Set trip_id = Nil to all users
    @users = User.where(:trip_id => @trip)
    @users.trip_id = nil

    @users.save!
    @trip.destroy!
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :departure_time, :seats, :driver_id, :source_id, :destination_id)
  end
end
