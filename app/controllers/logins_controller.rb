class LoginsController < ApplicationController
  def new
    render nothing: true
  end

  def create
    if LoginCommand.new.run(params)
      redirect_to dashboard_path
    else
      flash[:error] = I18n.translate(:invalid_credentials)
      render :new
    end
  end
end
