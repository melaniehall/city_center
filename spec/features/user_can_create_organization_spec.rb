require "spec_helper"

feature "User can create organization" do
  let(:user) {FactoryGirl.create(:user)}

  scenario "User can successfully create an organization" do
    login_user(user)

    click_link_or_button "Add Organization"
    fill_in "Name", with: "My New Organization"
    fill_in "Bio", with: "My Bio"
    click_link_or_button "Create Organization"

    page.should have_content "Your organization has been created"
    page.should have_content "My New Organization"
  end

  scenario "User cannot create an organization without a name" do
    login_user(user)

    click_link_or_button "Add Organization"
    fill_in "Bio", with: "My Bio"
    click_link_or_button "Create Organization"

    page.should have_content "Name can't be blank"
  end
end