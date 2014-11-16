class LoginPage < PageModel
  def initialize
    super(new_session_path)
  end

  def login_with(email:, password:)
    within ".form-signin" do
      fill_in 'email', with: email
      fill_in 'password', with: password
    end
    click_button "Sign in"
  end
end
