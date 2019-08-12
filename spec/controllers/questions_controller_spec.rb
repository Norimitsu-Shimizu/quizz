require 'rails_helper'

describe QuestionsController do
  let(:user) { create(:user) }
  let(:genre) { create(:genre) }

  describe '#index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe '#new' do
    it "renders the :new template" do
      login user
      get :new
      expect(response).to render_template :new
    end

    it "returns a 200 response" do
      login user
      get :new
      expect(response).to have_http_status "200"
    end

    it "does not respond successfully" do
      get :new
      expect(response).to_not be_success
    end

    it "returns a 302 respose" do
      get :new
      expect(response).to have_http_status "302"
    end

    it "redirects the page to /users/sign_in" do
      get :new
      expect(response).to redirect_to "/users/sign_in"
    end
  end

  describe '#show' do
    
    it "renders the :show template" do
      question = create(:question, user_id: user.id, genre_id: genre.id)
      get :show, params: {id: question.id}
      expect(response).to render_template :show
    end

    it "returns a 200 response" do
      question = create(:question, user_id: user.id, genre_id: genre.id)
      get :show, params: {id: question.id}
      expect(response).to have_http_status "200"
    end

    it "assigns @question" do
      question = create(:question, user_id: user.id, genre_id: genre.id)
      get :show, params: {id: question.id}
      expect(assigns(:question)).to eq question
    end
  end
end