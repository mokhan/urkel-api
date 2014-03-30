require "spec_helper"

describe LoginsController do
  context "#new" do
    it "loads the login page" do
      get :new
      response.should be_ok
    end
  end
end
