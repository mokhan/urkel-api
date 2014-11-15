require "rails_helper"

describe SessionsController do
  describe "#new" do
    it "loads the login page" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "#create" do
    let!(:user) { create(:user, password: 'password') }

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
      before { post :create, email: user.email, password: 'password' }

      it "redirects to the dashboard" do
        expect(response).to redirect_to(root_path(anchor: ''))
      end

      it 'assigns a session key to a secure cookie' do
        expect(cookies.signed[:raphael]).to eql(Session.last.id)
      end
    end
  end

  context "#destroy" do
    let(:user_session) { create(:session) }

    it "removes the current session" do
      delete :destroy, { id: 'mine' }, { user_session_id: user_session.id }
      expect(session[:user_session_id]).to be_nil
      expect(response).to redirect_to(new_session_path)
    end
  end
end
