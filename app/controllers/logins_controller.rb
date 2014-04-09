class LoginsController < ApplicationController
  before_filter :load_dependencies
  layout 'public'

  def new
  end

  def create
    if @login_command.run(params)
      redirect_to dashboard_path
    else
      flash[:error] = I18n.translate(:invalid_credentials)
      render :new
    end
  end

  private

  def load_dependencies(login_command = resolve(:login_command))
    @login_command = login_command
  end
end
