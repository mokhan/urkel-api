require "rails_helper"

describe ApplicationController do
  controller do
    def index
      current_user
      render text: 'hello'
    end
  end

  context "when signed in" do
    let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
    let(:user_session) { create(:session, user: user) }

    before { cookies.signed[:raphael] = user_session.id }
    before { get :index }

    it "lets you continue to do whatever the heck you were trying to do" do
      expect(response.status).to eql(200)
    end

    it "loads the current user" do
      expect(assigns(:current_user)).to eql(user)
    end
  end

  context "when not signed in" do
    before :each do
      cookies.signed[:raphael] = rand(100)
      get :index
    end

    it "boots you out when their is no session_id" do
      expect(response).to redirect_to(new_session_path)
    end

    it "boots you out when the session id is not known" do
      expect(response).to redirect_to(new_session_path)
    end
  end
end
