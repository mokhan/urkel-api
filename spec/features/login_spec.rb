require 'rails_helper'

describe "the signin process", type: :feature do
  let!(:user) { create(:user, password: 'password') }

  it 'signs the user in' do
    visit root_path
    within ".form-signin" do
      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'
    end
    click_button "Sign in"
    expect(page).to have_content("Dashboard")
  end

  context "when the password is incorrect" do
    it 'displays an error' do
      visit root_path
      within ".form-signin" do
        fill_in 'email', with: user.email
        fill_in 'password', with: 'wrong'
      end
      click_button "Sign in"
      expect(page).to have_content(I18n.translate(:invalid_credentials))
    end
  end
end
