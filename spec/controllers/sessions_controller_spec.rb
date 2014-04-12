require "spec_helper"

describe SessionsController do
  describe "#new" do
    it "loads the login page" do
      get :new
      response.should be_ok
    end
  end

  describe "#create" do
    let(:user) { double(id: 1, authenticate: false) }

    before :each do
      User.stub(:find_by).with(email: 'email@example.com').and_return(user)
      User.stub(:find_by).with(email: 'unknown@example.com').and_return(nil)
      user.stub(:authenticate).with('password').and_return(true)
    end

    context "when the email and password is incorrect" do
      it "displays an error" do
        post :create, email: 'email@example.com', password: 'wrong'
        flash[:error].should == I18n.translate(:invalid_credentials)
        response.should render_template(:new)
      end
    end

    context "when the email is not known" do
      it "displays an error" do
        post :create, email: 'unknown@example.com'
        flash[:error].should == I18n.translate(:invalid_credentials)
        response.should render_template(:new)
      end
    end

    context "when the email and password is correct" do
      before :each do
        post :create, email: 'email@example.com', password: 'password'
      end

      it "redirects to the dashboard" do
        response.should redirect_to(root_path(anchor: ''))
      end

      it "creates a new session" do
        session[:user_session_id].should_not be_nil
        last_session = Session.last
        session[:user_session_id].should == last_session.id
        last_session.ip_address.should == "0.0.0.0"
      end
    end
  end
end
