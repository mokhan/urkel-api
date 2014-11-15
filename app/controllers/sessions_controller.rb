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
    if user_session = @login_command.run(self)
      cookies.signed[:raphael] = user_session
      redirect_to root_path(anchor: '')
    else
      flash[:error] = I18n.translate(:invalid_credentials)
      render :new
    end
  end

  def destroy
    reset_session
    cookies.delete(:raphael)
    current_session.revoke!
    redirect_to new_session_path
  end
end
