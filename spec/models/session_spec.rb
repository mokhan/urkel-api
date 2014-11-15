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

  context ".authenticate" do
    let(:user_session) { create(:session) }

    context "when the session key is legit" do
      it 'returns the session' do
        expect(Session.authenticate!(user_session.id)).to eql(user_session)
      end
    end

    context "when the session key is incorrect" do
      it 'raises an error' do
        expect(-> { Session.authenticate!('blah') }).to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context "#revoke!" do
    subject { create(:user_session) }

    it 'marks the time the session was revoked' do
      subject.revoke!
      expect(subject.revoked_at).to_not be_nil
    end
  end
end
