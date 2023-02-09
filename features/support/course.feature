
Feature: Create course
  
  In order to be able to create a course I want to be able to log in and add a course with details on the admins page for course creation.
  
  Scenario: I have an account I log in and create a course
    Given I have an account with course creator rights
    And I am logged in
    When I create a course record with title and description
    Then I should see a record of the course and a confirmation message
    And The course should have a title and the description
    And I should receive the confirmation via email that I created a new course
  