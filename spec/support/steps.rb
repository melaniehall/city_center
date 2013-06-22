def login_user(user)
  visit root_path
  click_link_or_button idsf('the sign in button')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: "password"
  click_link_or_button idsf('the sign in button')
end