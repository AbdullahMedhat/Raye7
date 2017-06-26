require './spec/rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'creation' do
    it 'should create a new user and return created object in json' do
      group = create(:group1)
      place = create(:place1)
      place = create(:place2)
      post :create, params: { user: attributes_for(:user) }, format: :json

      expect(User.count).to eql 1

      user = User.first
      expect(response.body).to eql(user.to_json)
    end

    it 'should return bad request and the errors if validation fails' do
      post :create, params: { user: attributes_for(:invalid_user) }, format: :json
      user = build(:invalid_user)
      user.valid?

      expect(response).to have_http_status(400)
      expect(response.body).to eql(user.errors.full_messages.to_json)
    end

    it { should route(:post, '/users').to(action: :create) }
  end
end
