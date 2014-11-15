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
end
