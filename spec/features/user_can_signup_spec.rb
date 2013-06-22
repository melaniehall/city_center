require 'spec_helper'

feature "User can signup", :js => true do
  background do
    visit root_path
    click_link_or_button idsf('the sign up button')
  end

  scenario "User is created after they signup" do
    User.count.should eql(0)
    fill_in 'Name', with: "Bob"
    fill_in 'Email', with:'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_link_or_button idsf('the sign up button')
    User.count.should eql(1)
  end

  scenario "User tries to signup without name" do
    User.count.should eql(0)
    fill_in 'Email', with:'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_link_or_button idsf('the sign up button')
    page.should have_content ("Name can't be blank")
    User.count.should eql(0)
  end

  scenario "User tries to signup with invalid email" do
    User.count.should eql(0)
    fill_in 'Name', with: "Bob"
    fill_in 'Email', with:'bobexample.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_link_or_button idsf('the sign up button')
    page.should have_text ("Email is invalid")
    User.count.should eql(0)
  end

end