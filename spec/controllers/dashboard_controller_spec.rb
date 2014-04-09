require "spec_helper"

describe DashboardController do
  context "#index" do
    it "loads the current user" do
      get :index
      assigns(:current_user).should == user
    end
  end
end
