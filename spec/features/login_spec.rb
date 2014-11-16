require 'rails_helper'

describe "the signin process", type: :feature do
  let!(:user) { create(:user, password: 'password') }
  let(:login_page) { LoginPage.new }
  let(:dashboard_page) { DashboardPage.new }

  context "when the credentials are correct" do
    it 'signs the user in' do
      login_page.visit_page.login_with(email: user.email, password: 'password')
      expect(dashboard_page).to be_on_page
    end
  end

  context "when the password is incorrect" do
    it 'displays an error' do
      login_page.visit_page.login_with(email: user.email, password: 'wrong')
      expect(login_page).to be_on_page
      expect(login_page).to have_error(:invalid_credentials)
    end
  end

  context "when the email is unknown" do
    it 'displays an error' do
      login_page.visit_page.login_with(email: 'test@example.com', password: 'password')
      expect(login_page).to be_on_page
      expect(login_page).to have_error(:invalid_credentials)
    end
  end
end
