module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate
      skip_before_action :verify_authenticity_token
      skip_before_action :ensure_valid_session
      attr_reader :current_environment

      private

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @current_environment = Environment.find_by(api_key: token)
        end
      end
    end
  end
end
