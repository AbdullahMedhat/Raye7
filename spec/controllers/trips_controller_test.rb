require './spec/rails_helper'

RSpec.describe TripsController, type: :controller do
  context 'listing' do
    before(:each) do
      @group = FactoryGirl.create(:group)
      @place = FactoryGirl.create(:place)
      @place1 = FactoryGirl.create(:place1)
      @user = FactoryGirl.create(:user)
    end

    it 'should return all Trips in the database' do
      group2 = FactoryGirl.create(:group2)
      place3 = FactoryGirl.create(:place3)
      place4 = FactoryGirl.create(:place4)
      user1 = FactoryGirl.create(:user1)

      trip1 = create(:trip)
      get :index, format: :json
      expect(response.body).to eql([trip1].to_json)
    end

    it 'should return a single trip given an id' do
      trip = create(:trip)

      get :show, params: { id: trip.id }, format: :json

      expect(response.body).to eql(trip.to_json)
    end
  end
  # context 'creation' do
  #   it 'should create a new trip and return created object in json' do
  #     post :create, params: { trip: attributes_for(:trip) }, format: :json

  #     expect(trip.count).to eql 1

  #     trip = trip.first
  #     expect(response.body).to eql(trip.to_json)
  #   end

  #   it 'should return bad request and the errors if validation fails' do
  #     post :create, params: { trip: attributes_for(:invalid_trip) }, format: :json
  #     trip = build(:invalid_trip)
  #     trip.valid?

  #     expect(response).to have_http_status(400)
  #     expect(response.body).to eql(trip.errors.full_messages.to_json)
  #   end
  # end
end
