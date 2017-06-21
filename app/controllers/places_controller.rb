class PlacesController < ApplicationController
  def index
    @places = Place.all
    render json: @places
  end

  def update
    @place = Place.find params[:id]
    @place.update! place_params
    render json: @place
  end

  def create
    @place = Place.new place_params
    @place.save!
    render json: @place
  end

  def destroy
    @place = Place.find params[:id]
    @place.destroy!
    render json: @place
  end

  private
  def place_params
    params.require(:place).permit(:name, :longitude, :latitude)
  end
end
