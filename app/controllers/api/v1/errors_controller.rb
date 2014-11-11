module Api
  module V1
    class ErrorsController < ApiController
      def create
        failure = current_environment.failures.build(error_params)
        failure.backtrace = params[:error][:backtrace]
        failure.save!
        render nothing: true
      end

      private

      def error_params
        params.require(:error).permit(:message, :hostname, :error_type, :backtrace)
      end
    end
  end
end
