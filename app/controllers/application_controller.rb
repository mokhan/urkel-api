class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :ensure_valid_session

  def resolve(key)
    Spank::IOC.resolve(key)
  end

  def current_user
    @current_user ||= @current_session.user
  end

  private

  def ensure_valid_session
    #::TODO look up session by unique session key not id.
    unless session[:user_session_id] && @current_session = Session.find(session[:user_session_id])
      redirect_to new_session_path
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to new_session_path
  end
end
