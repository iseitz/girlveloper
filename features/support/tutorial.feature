Feature: Create tutorial
  
  In order to be able to create a tutorial I want to be able to log in and add a tutorial with descriptions on the tutorial admins page.
  
  Scenario: I create a tutorial
    Given I have an account
    And I am logged in
    When I create a tutorial record
    Then I should see a record of the tutorial and a confirmation message
    And I should receive the confirmation via email that I created a new tutorial