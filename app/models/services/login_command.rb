class LoginCommand
  def initialize(users = User)
    @users = users
  end

  def run(params)
    @users.find_by(email: params[:email]).authenticate(params[:password])
  end
end
