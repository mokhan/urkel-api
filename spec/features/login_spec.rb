require 'rails_helper'

describe "the signin process", type: :feature do
  let!(:user) { create(:user, password: 'password') }
  let(:login_page) { LoginPage.new }

  context "when the credentials are correct" do
    it 'signs the user in' do
      login_page.login_with(email: user.email, password: 'password')
      expect(page).to have_content("Dashboard")
      expect(current_path).to eql(root_path)
    end
  end

  context "when the password is incorrect" do
    it 'displays an error' do
      login_page.login_with(email: user.email, password: 'wrong')
      expect(page).to have_content(I18n.translate(:invalid_credentials))
      expect(current_path).to eql(new_session_path)
    end
  end

  context "when the email is unknown" do
    it 'displays an error' do
      login_page.login_with(email: 'test@example.com', password: 'password')
      expect(page).to have_content(I18n.translate(:invalid_credentials))
      expect(current_path).to eql(new_session_path)
    end
  end
end
