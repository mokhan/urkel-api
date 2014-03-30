require "spec_helper"

describe LoginsController do
  describe "#new" do
    it "loads the login page" do
      get :new
      response.should be_ok
    end
  end

  describe "#create" do
    let(:user) { double(authenticate: false) }

    before :each do
      User.stub(:find_by).with(email: 'email@example.com').and_return(user)
      user.stub(:authenticate).with('password').and_return(true)
    end

    context "when the email and password is incorrect" do
      it "displays an error" do
        post :create, email: 'email@example.com', password: 'wrong'
        flash[:error].should == I18n.translate(:invalid_credentials)
        response.should render_template(:new)
      end
    end

    context "when the email and password is correct" do
      it "redirects to the dashboard" do
        post :create, email: 'email@example.com', password: 'password'
        response.should redirect_to(dashboard_path)
      end
    end
  end
end
