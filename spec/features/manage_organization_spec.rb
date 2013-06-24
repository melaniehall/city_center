require "spec_helper"

feature "Manage organization" do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:user_without_organization) {FactoryGirl.create(:user, email: "bob2@example.com")}

  background do
    user_creates_organization_and_signs_out(user)
  end

  scenario "Authorized user can successfully edit their organization" do
    login_user(user)

    visit root_path
    click_link_or_button(user.organizations.first.name)
    click_link_or_button "Edit Profile"
    fill_in "Name", with: "My Awesome Organization"
    fill_in "Bio", with: "My Bio"
    click_link_or_button "Edit Profile"

    page.should have_content "My Awesome Organization"
  end

  scenario "Unauthorized user should not see an edit organization profile link" do
    login_user(user_without_organization)

    visit organization_path(Organization.first)
    page.should_not have_content "Edit Profile"
  end

  scenario "Unauthorized user cannot edit profile of another user's organization" do
    login_user(user_without_organization)

    visit edit_organization_path(Organization.first)
    page.should_not have_content "My New Organization"
    page.should have_content "not permitted"
  end

  scenario "Authorized user can delete their organization", :js => true do
    login_user(user)

    visit organization_path(Organization.first)
    click_link_or_button "Delete Organization"

    page.driver.browser.switch_to.alert.text.should match "Are you sure"
    page.driver.browser.switch_to.alert.accept

    page.should have_content "Your organization has been deleted"
  end
end