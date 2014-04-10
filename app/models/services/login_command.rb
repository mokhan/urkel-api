class LoginCommand
  def initialize(users = User)
    @users = users
  end

  def run(context)
    user = @users.find_by(email: context.params[:email])
    if user && user.authenticate(context.params[:password])
      Session.create!(user_id: user.id, ip_address: context.request.remote_ip)
    end
  end
end
