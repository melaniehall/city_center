Feature: User can log-in and log-out
        In order to add events
        As a user
        I want to sign in

        Scenario: Signed out users see appropriate links
          Given I am on the home page
          Then I should see "Calendar"
          And I should see "Community"
          Then I should see "Sign In"
          And I should see "Sign Up"
          And I should not see "Sign Out"

        Scenario: Signed in users see appropriate links
          Given the user "sue@example.com" with password "password2"
          When I go to the home page
          Then I should see "Sign Out"
          And I should see the link "Edit Account"
          And I should see the link "Calendar"
          And I should see "Community"
          And I should see the link "Profile"
          And I should not see "Sign In"
          And I should not see "Sign Up"

        Scenario: Signing In- Happy Path
          Given the user "bob@example.com" with password "password1".
          When I go to the home page
          And I click "Sign In"
          And I fill in "bob@example.com" for "Email"
          And I fill in "password1" for "Password"
          And I click "Sign in"
          Then I should see "Signed in successfully"

        Scenario: Signing in with incorrect password
          Given there is a user "sue@example.com" with password "password2"
          And I am on the home page
          And I click "Sign In"
          And I fill in "sue@example.com" for "Email"
          And I fill in "wrong_password" for "Password"
          And I click "Sign in"
          Then I should see "Invalid e-mail or password"
          And I should see "sue@example.com" in the "Email" field

        Scenario: Signing out- Happy Path
          Given I am signed in
          And I am on the home page
          When I click "Sign out"
          Then I should see "Signed out successfully"
          And I should not see "Profile"
          And I should not see "Edit Account"


