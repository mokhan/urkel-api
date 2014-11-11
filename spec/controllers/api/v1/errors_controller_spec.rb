require 'rails_helper'

module Api
  module V1
    describe ErrorsController do
      describe "#create" do
        let(:service) { create(:service) }
        let(:environment) { create(:environment, service: service) }
        let(:token) { ActionController::HttpAuthentication::Token.encode_credentials(environment.api_key) }
        let(:error) do
          begin
            1/0
          rescue StandardError => error
            error
          end
        end
        let(:hostname) { Socket.gethostname }

        before :each do
          request.env['HTTP_AUTHORIZATION'] = token
        end

        it 'saves a new error' do
          xhr :post, :create, error: { message: error.message, hostname: hostname, error_type: error.class, backtrace: error.backtrace }
          environment.reload

          expect(response.status).to eql(200)
          expect(environment.failures.count).to eql(1)
          failure = Failure.last
          expect(failure.message).to eql(error.message)
          expect(failure.hostname).to eql(hostname)
          expect(failure.error_type).to eql(error.class.to_s)
          expect(failure.backtrace).to eql(error.backtrace)
        end
      end
    end
  end
end
