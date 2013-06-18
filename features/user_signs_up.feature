Feature: User signs up

  Scenario: Happy Path
    Given I am on the home page
    When I click "Sign Up"
    And I fill in "melanie@example.com" for "Email"
    And I fill in "password" for "Password"
    And I fill in "password" for "Password confirmation"
    And I click "Sign up"
    Then I should see "Welcome! You have signed up successfully."

  Scenario: User skips password
    Given I am on the home page
    When I click "Sign Up"
    And I fill in "bob@example.com" for "Email"
    And I fill in "" for "Password"
    Then I should see "Password cannot be blank"

  Scenario: Invalid email
    Given I am on the home page
    When I click "Sign Up"
    And I fill in "bobexample.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign up"
    Then I should see "Email is invalid"



