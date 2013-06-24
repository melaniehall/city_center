require 'spec_helper'

feature "User can login", :js => true do
  let!(:user) { FactoryGirl.create(:user) }
  background do
    visit root_path
    click_link_or_button idsf('the sign in button')
  end

  scenario "User is directed to the home page after they login" do
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    click_link_or_button idsf('the sign in button')
    page.should have_content "Intro"
    page.should have_selector(:link_or_button, idsf('the sign out button'))
  end

  scenario "User logs in with wrong password" do
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'wrong_password'
    click_link_or_button idsf('the sign in button')
    page.should have_content "Invalid email or password."
  end

  scenario "User logs in with invalid email" do
    fill_in 'Email', with: 'bobexample.com'
    fill_in 'Password', with: 'password'
    click_link_or_button idsf('the sign in button')
    page.should have_content "Invalid email or password."
  end
end