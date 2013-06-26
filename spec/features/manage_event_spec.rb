require "spec_helper"

feature "Manage organization" do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:user_without_organization) {FactoryGirl.create(:user, email: "bob2@example.com")}
  let!(:event) {FactoryGirl.create(:event)}
  background do
    user_creates_organization_and_signs_out(user)
  end

  scenario "Authorized user can successfully edit an event" do
    login_user(user)

    visit root_path
    click_link_or_button("My New Event")
    click_link_or_button "Edit Event Details"
    fill_in "Name", with: "My Awesome New Event"
    click_link_or_button "Update Event"

    page.should have_content "My Awesome New Event"
  end

  scenario "Authorized user can delete their organization's event", :js => true do
    login_user(user)

    visit organization_event_path(Organization.first, event)
    click_link_or_button "Delete Event"

    page.driver.browser.switch_to.alert.text.should match "Are you sure"
    page.driver.browser.switch_to.alert.accept

    page.should have_content "Your event has been deleted"
  end

  scenario "Unauthorized user should not see an edit event details link" do
    login_user(user_without_organization)

    visit organization_event_path(Organization.first, event)
    page.should_not have_content "Edit Profile"
  end

  scenario "Unauthorized user cannot edit another organization's event" do
    login_user(user_without_organization)

    visit "organizations/1/events/1/edit"
    page.should_not have_content "My New Organization"
    page.should have_content "Only authorized organizations"
  end
end