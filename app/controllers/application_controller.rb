class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_valid_session

  def resolve(key)
    Spank::IOC.resolve(key)
  end

  def current_user
    @current_user ||= @current_session.user
  end

  private

  def ensure_valid_session
    unless session[:session_id] && @current_session = Session.find(session[:session_id])
      render nothing: true, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render nothing: true, status: :unauthorized
  end
end
