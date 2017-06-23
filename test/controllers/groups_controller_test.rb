# require 'test_helper'
require 'rails_helper'

# class GroupsControllerTest < ActionDispatch::IntegrationTest
#   # test "the truth" do
#   #   assert true
#   # end
# end

RSpec.describe GroupsController, type: :controller do
  context 'listing' do
    it "should return all groups in the database" do
      group1, group2 = create(:group), create(:group)
      get :index, format: :json
      expect(response.body).to eql([group1, group2].to_json)
    end

    it 'should return a single group given an id' do
      group = create(:group)

      get :show, params: { id: group.id }, format: :json

      expect(response.body).to eql(group.to_json)
    end
  end

  context 'creation' do
    it 'should create a new group and return the newly created object in json' do
      post :create, params: {group: attributes_for(:group)}, format: :json

      expect(group.count).to eql 1

      group = group.first
      expect(response.body).to eql(group.to_json)
    end

    it 'should return bad request and the errors if validation fails' do
      post :create, params: { group: attributes_for(:invalid_group) }, format: :json
      group = build(:invalid_group)
      group.valid?

      expect(response).to have_http_status(400)
      expect(response.body).to eql(group.errors.full_messages.to_json)
    end
  end
end
