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

    before { get :index, {}, user_session_id: user_session.id }

    it "lets you continue to do whatever the heck you were trying to do" do
      expect(response.status).to eql(200)
    end

    it "loads the current user" do
      expect(assigns(:current_user)).to eql(user)
    end
  end

  context "when not signed in" do
    it "boots you out when their is no session_id" do
      get :index
      expect(response).to redirect_to(new_session_path)
    end

    it "boots you out when the session id is not known" do
      allow(Session).to receive(:find).with(100).and_raise(ActiveRecord::RecordNotFound)

      get :index, {}, user_session_id: 100
      expect(response).to redirect_to(new_session_path)
    end
  end
end
