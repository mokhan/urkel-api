module HttpAuthentication
  def http_login(user, password = 'password')
    user_session = create(:session, user: user)
    cookies.signed[:raphael] = user_session.id
  end
end
