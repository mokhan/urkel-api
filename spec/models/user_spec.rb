require "rails_helper"

describe User do
  context "#save" do
    it "can be saved" do
      User.create!(email: 'mo@mokhan.ca', password: 'password', password_confirmation: 'password')
      User.count.should == 1
    end
  end

  context "#authenticate" do
    let(:user) { User.create!(email: 'blah@example.com', password: 'password', password_confirmation: 'password') }

    it "returns true when the password is correct" do
      user.authenticate('password').should be_truthy
    end

    it "returns false when the password is incorrect" do
      user.authenticate('wrong').should be_falsey
    end
  end
end
