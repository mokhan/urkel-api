require 'rails_helper'

describe LoginCommand do
  subject { LoginCommand.new }

  describe "#run" do
    let(:user) { create(:user) }
    let(:web_context) { double(params: { email: user.email, password: 'password' }, request: web_request) }
    let(:web_request) { double(remote_ip: '192.168.0.1') }

    context "when the credentials are valid" do
      it 'returns a new user session' do
        result = subject.run(web_context)
        expect(result[:value]).to_not be_nil
        expect(result[:httponly]).to eql(true)
      end
    end
  end
end
