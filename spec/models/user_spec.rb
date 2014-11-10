require "rails_helper"

describe User do
  context "#save" do
    it "can be saved" do
      User.create!(email: 'mo@mokhan.ca', password: 'password', password_confirmation: 'password')
      expect(User.count).to eql(1)
    end
  end

  context "#authenticate" do
    let(:user) { User.create!(email: 'blah@example.com', password: 'password', password_confirmation: 'password') }

    it "returns true when the password is correct" do
      expect(user.authenticate('password')).to be_truthy
    end

    it "returns false when the password is incorrect" do
      expect(user.authenticate('wrong')).to be_falsey
    end
  end
end
