class LoginPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def login_with(email:, password:)
    visit root_path
    within ".form-signin" do
      fill_in 'email', with: email
      fill_in 'password', with: password
    end
    click_button "Sign in"
  end
end

