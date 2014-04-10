require "spec_helper"

describe ApplicationController do
  controller do
    def index
      render text: 'hello'
    end
  end

  context "when signed in" do
    let(:user_session) { Object.new }

    it "lets you continue to do whatever the heck you were trying to do" do
      Session.stub(:find).with(1).and_return(user_session)
      get :index, {}, session_id: 1
      response.status.should == 200
    end
  end

  context "when not signed in" do
    it "boots you out when their is no session_id" do
      get :index
      response.status.should == 401
    end

    it "boots you out when the session id is not known" do
      Session.stub(:find).with(100).and_raise(ActiveRecord::RecordNotFound)

      get :index, {}, session_id: 100
      response.status.should == 401
    end
  end
end