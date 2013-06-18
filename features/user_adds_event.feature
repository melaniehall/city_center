@wip

Feature: User adds event
  Scenario: Happy Path
    Given I am logged in
    And I fill in "Event Name" for "Name"
    And I fill in "2013/04/20" for "Date"
    And I fill in "This is my event description" for "Description"
    And I press "Add Event"
    Then I should see "Your event has been successfully added!"
    And I should see the following:
        | 04/20/2013- Event Name |

    Scenario: Blank Name
      Given I am logged in
      And I fill in "" for "Name"
      And I press "Add Event"
      Then I should see "Name cannot be blank"

    Scenario: Blank Date
      Given I am logged in
      And I fill in "Mixer" for "Name"
      And I fill in "" for "Date"
      And I fill in "Description" for "Description"
      Then I should see "Date cannot be blank"






