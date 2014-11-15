require 'rails_helper'

describe LoginCommand do
  subject { LoginCommand.new }

  describe "#run" do
    let(:user) { create(:user) }
    let(:web_request) { double(remote_ip: '192.168.0.1') }
    let(:web_context) { double(params: params, request: web_request) }

    context "when the credentials are valid" do
      let(:params) { { email: user.email, password: 'password' } }

      it 'returns a new user session' do
        result = subject.run(web_context)
        expect(result[:value]).to_not be_nil
        expect(result[:httponly]).to eql(true)
      end
    end

    context "when the email is not known" do
      let(:params) { { email: 'blah@example.com', password: 'password' } }

      it 'returns nil' do
        expect(subject.run(web_context)).to be_nil
      end
    end

    context "when the password is incorrect" do
      let(:params) { { email: user.email, password: 'wrong' } }

      it 'returns nil' do
        expect(subject.run(web_context)).to be_nil
      end
    end
  end
end
