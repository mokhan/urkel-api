require "rails_helper"

describe SessionsController do
  describe "#new" do
    it "loads the login page" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "#create" do
    let(:user) { double(id: 1, authenticate: false) }

    before :each do
      allow(User).to receive(:find_by).with(email: 'email@example.com').and_return(user)
      allow(User).to receive(:find_by).with(email: 'unknown@example.com').and_return(nil)
      allow(user).to receive(:authenticate).with('password').and_return(true)
    end

    context "when the email and password is incorrect" do
      it "displays an error" do
        post :create, email: 'email@example.com', password: 'wrong'
        expect(flash[:error]).to eql(I18n.translate(:invalid_credentials))
        expect(response).to render_template(:new)
      end
    end

    context "when the email is not known" do
      it "displays an error" do
        post :create, email: 'unknown@example.com'
        expect(flash[:error]).to eql(I18n.translate(:invalid_credentials))
        expect(response).to render_template(:new)
      end
    end

    context "when the email and password is correct" do
      before :each do
        post :create, email: 'email@example.com', password: 'password'
      end

      it "redirects to the dashboard" do
        expect(response).to redirect_to(root_path(anchor: ''))
      end

      it "creates a new session" do
        expect(session[:user_session_id]).to_not be_nil
        last_session = Session.last
        expect(session[:user_session_id]).to eql(last_session.id)
        expect(last_session.ip_address).to eql("0.0.0.0")
      end
    end
  end

  context "#destroy" do
    let(:user_session) { Session.create! }

    it "removes the current session" do
      delete :destroy, { id: 'mine' }, { user_session_id: user_session.id }
      expect(session[:user_session_id]).to be_nil
      expect(response).to redirect_to(new_session_path)
    end
  end
end
