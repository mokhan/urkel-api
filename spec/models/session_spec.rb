require "rails_helper"

describe Session do
  context "#save" do
    it "creates a new session" do
      Session.create!(user_id: 1, ip_address: '127.0.0.1')
      session = Session.last
      expect(session.user_id).to eql(1)
      expect(session.ip_address).to eql("127.0.0.1")
    end
  end
end
