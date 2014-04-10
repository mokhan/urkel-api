class LoginsController < ApplicationController
  before_filter :load_dependencies
  skip_before_filter :ensure_valid_session, only: [:new, :create]
  layout 'public'

  def new
  end

  def create
    if @session = @login_command.run(self)
      session[:session_id] = @session.id
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
