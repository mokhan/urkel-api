class LoginsController < ApplicationController
  def new
    render nothing: true
  end

  def create
    if User.find_by(email: params[:email]).authenticate(params[:password])
      redirect_to dashboard_path
    else
      flash[:error] = I18n.translate(:invalid_credentials)
      render :new
    end
  end
end
