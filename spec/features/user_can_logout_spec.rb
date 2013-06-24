require 'spec_helper'

feature "User can logout", :js => true do
  let!(:user) { FactoryGirl.create(:user) }
  background do
    login_user(user)
    visit root_path
  end

  scenario "User is directed to the home page after they logout" do
    click_link_or_button idsf('the sign out button')
    page.should have_content "Intro"
  end

end