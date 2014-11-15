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

  context "validations" do
    subject { build(:user) }

    context "when all fields are provided" do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context "when the email is blank" do
      it 'produces an error' do
        subject.email = ''
        expect(subject).to_not be_valid
        expect(subject.errors[:email]).to_not be_empty
      end
    end

    context "when the email is invalid" do
      it 'produces an error when' do
        subject.email = 'blah'
        expect(subject).to_not be_valid
        expect(subject.errors[:email]).to_not be_empty
      end
    end

    context 'when the email is legit' do
      it 'is valid' do
        expect(subject).to be_valid
        expect(subject.errors[:email]).to be_empty
      end
    end

    context "when the password is missing" do
      it 'produces an error' do
        subject.password = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
