class LoginCommand
  def initialize(users = User)
    @users = users
  end

  def run(context)
    user = @users.find_by(email: context.params[:email])
    return nil unless user

    if user && (user_session = user.login(context.params[:password]))
      user_session.access(context.request)
    end
  end
end
