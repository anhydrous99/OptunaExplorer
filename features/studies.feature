Feature: Creating and Editing Studies
  Tests the creation and editing of studies

Scenario: Redirect after login
  Given I am a valid user and am logged in
  Then I go to the studies page
  Then I should see "Study Name"
  And I should be in the user's subdomain

Scenario Outline: Create a Study
  Given I am a valid user and am logged in
  When I go to the studies page
  Then I click the link "Create Study"
  Then I fill in "study_study_name" with "<study_name>"
  Then I select "<direction>" from "study_direction"
  Then I press "Create Study"
  Then the study should have been successfully created
  And I should be in the trials page
  Then I click the link "Studies"
  Then I should see "Study Name"
  And I should see "<study_name>"
  And I should see "<direction>"
  Examples:
  | study_name | direction |
  | asdf       | MAXIMIZE  |
  | blues      | MINIMIZE  |
  | hAT_324    | MINIMIZE  |

Scenario: Edit a Study
  Given I am a valid user and am logged in
  Then I create a study
  When I go to the studies page
  Then I should see said study in the table
  Then I click the link "Edit"
  And I fill in "study_study_name" with "asdf"
  And I select "MAXIMIZE" from "study_direction"
  And I press "Update Study"
  Then I should see "Study was successfully updated."
  Then I click the link "Studies"
  And I should see "asdf"

Scenario: Remove Study
  Given I am a valid user and am logged in
  Then I create a study
  When I go to the studies page
  Then I click the link "Remove"
  Then I should see "Study was successfully destroyed."

Scenario: See more details
  Given I am a valid user and am logged in
  Then I create a study
  When I go to the studies page
  Then I click the link "Show Details"
  Then I should see "Trial"
  And I should see "Value"
  And I should see "Datetime start"

Scenario: Displays correct mysql url
  Given I am a valid user and am logged in
  When I go to the studies page
  Then I should see my mysql url
