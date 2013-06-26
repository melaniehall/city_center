require "spec_helper"

feature "Organization can create event" do
  let(:user_with_organization) {FactoryGirl.create(:user)}
  let!(:user_without_organization) {FactoryGirl.create(:user, email: "bob2@example.com")}
  let!(:event) {FactoryGirl.create(:event)}
  background do
    user_creates_organization_and_signs_out(user_with_organization)
  end

  scenario "Organization can successfully create an event" do
    login_user(user_with_organization)

    click_link_or_button "Add Event"
    fill_in "Name", with: "My Event"
    fill_in "Description", with: "My Event's Description"
    fill_in "Scheduled on", with: "2013-06-25"
    fill_in "Starts at", with: "6:00pm"
    fill_in "Ends at", with: "7:00pm"
    click_link_or_button "Create Event"

    page.should have_content "Your event has been created"
    page.should have_content "My Event"
  end

  scenario "Organization cannot create an event without a name", :js => true do
    login_user(user_with_organization)

    click_link_or_button "Add Event"
    fill_in "Description", with: "My Event's Description"
    click_link_or_button "Create Event"

    page.should_not have_content "Your event has been created"
    page.should have_content "Name can't be blank"
  end

  scenario "Unauthorized user cannot create an event" do
    login_user(user_without_organization)

    visit new_organization_event_path(Event.first)
    page.should_not have_content "New Event"
    page.should have_content "Only organizations can create events"
  end
end