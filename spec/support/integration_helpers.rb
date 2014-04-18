module IntegrationHelpers
  def test_sign_in(user_session)
    session[user_session.id]
  end
end
