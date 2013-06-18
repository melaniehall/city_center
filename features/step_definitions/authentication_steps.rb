Given /^I am logged in/ do
  @user = Fabricate(:user)
  sign_in_as @user
end

def sign_in_as user
    steps %{
      Given I am on the homepage
      When I click "Sign In"
      And I fill in "#{user.email}" for "Email"
      And I fill in "password" for "Password"
      And I click "Sign in"
      Then I should see "Signed in successfully."
    }
end