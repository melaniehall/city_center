def login_user(user)
  visit root_path
  click_link_or_button idsf('the sign in button')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: "password"
  click_link_or_button idsf('the sign in button')
end

def user_creates_organization(user)
  login_user(user)

  click_link_or_button "Add Organization"
  fill_in "Name", with: "My New Organization"
  fill_in "Bio", with: "My Bio"
  click_link_or_button "Create Organization"
end

def user_creates_organization_and_signs_out(user)
  login_user(user)

  click_link_or_button "Add Organization"
  fill_in "Name", with: "My New Organization"
  fill_in "Bio", with: "My Bio"
  click_link_or_button "Create Organization"

  logout_user
end

def logout_user
  click_link_or_button idsf('the sign out button')
end