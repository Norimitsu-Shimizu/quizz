require 'rails_helper'

describe UsersController do
  let(:level) { create(:level)}
  let(:user) { create(:user, level_id: level.id) }
  before do
    login user
  end

  describe '#show' do
    it "renders the :show template" do
      get :show, params: {id: user.id}
      expect(response).to render_template :show
    end

    it "returns a 200 response" do
      get :show, params: {id: user.id}
      expect(response).to have_http_status "200"
    end

    it "assigns @user" do
      get :show, params: {id: user.id}
      expect(assigns(:user)).to eq user
    end
  end
end