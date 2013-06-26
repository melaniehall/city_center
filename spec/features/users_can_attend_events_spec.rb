require "spec_helper"

feature "Users can attend events" do
  let(:user) {FactoryGirl.create(:user)}
  let!(:event) {FactoryGirl.create(:event)}
  let!(:organization) { FactoryGirl.create(:organization)}

  scenario "User can successfully attend an event", :js => true do
    login_user(user)

    visit organization_event_path(organization, event)
    click_link_or_button "Attend Event"

    page.should have_content "Your attendance has been saved"
    page.should have_content user.name
    page.should have_content "Leave Event"
  end

  scenario "User cannot be added as a duplicate attendee" do
    pp "User cannot be added as a duplicate attendee: should I move this spec into the controller or set spec up differently?"

    login_user(user)
    user_attends_event(user, event)

    visit organization_event_path(organization, event)
    click_link_or_button "Attend Event"

    page.should have_content "You are already attending this event."
    page.should have_content user.name
  end

  scenario "User can leave an event they are currently attending" do
    login_user(user)
    user_attends_event(user, event)

    visit organization_event_path(organization, event)
    click_link_or_button "Leave Event"

    page.should have_content "You are no longer attending this event."
    page.should_not have_content user.name
  end

end