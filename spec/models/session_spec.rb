require "spec_helper"

describe Session do
  context "#save" do
    it "creates a new session" do
      Session.create!(user_id: 1, ip_address: '127.0.0.1')
      session = Session.last
      session.user_id.should == 1
      session.ip_address.should == "127.0.0.1"
    end
  end
end
