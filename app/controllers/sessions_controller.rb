class SessionsController < ApplicationController
  skip_before_action :ensure_valid_session, only: [:new, :create]
  layout 'public'

  def initialize(login_command = resolve(:login_command))
    @login_command = login_command
    super()
  end

  def new
  end

  def create
    if @session = @login_command.run(self)
      session[:user_session_id] = @session.id
      cookies.signed[:raphael] = @session.access(request)
      redirect_to root_path(anchor: '')
    else
      flash[:error] = I18n.translate(:invalid_credentials)
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end
