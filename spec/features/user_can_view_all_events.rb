require "spec_helper"

feature "User can view all events" do
  let(:user_with_organization) { FactoryGirl.create(:user) }
  let!(:user_without_organization) { FactoryGirl.create(:user, email: "bob2@example.com") }
  let!(:event) { FactoryGirl.create(:event, :organization_id => 1) }
  let!(:event2) { FactoryGirl.create(:event, :organization_id => 1) }

  background do
    user_creates_organization_and_signs_out(user_with_organization)
  end

  scenario "All events are available to user with organization" do
    login_user(user_with_organization)

    visit events_path
    page.should have_content(event.name)
    page.should have_content(event2.name)
  end

  scenario "All events are available to a user without organization", :js => true do
    login_user(user_without_organization)

    visit events_path
    page.should have_content(event.name)
    page.should have_content(event2.name)
  end

end