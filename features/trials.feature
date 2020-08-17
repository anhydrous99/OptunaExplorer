Feature: Edit, Show and Delete Trials
  Tests the editing, the showing of details, and the deletion of trials

Scenario: Display Trial in Table
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists a trial
  Then I go to the trials page
  Then I should see the trial

Scenario: Display Trial Details
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists a trial
  Then I go to the trials page
  Then I click the link "Show"
  Then I should see the trial

Scenario: Set Trial Failed
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists a trial
  Then I go to the trials page
  Then I click the link "Set Failed"
  And I should see "FAIL"
  And I should see "Trial was successfully modified."

Scenario: Destroy Trial
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists a trial
  Then I go to the trials page
  Then I click the link "Destroy"
  Then I should see "Trial was successfully destroyed."
  And I should not see the trial

Scenario: Study Memoization
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists 5 trials
  Then I go to the studies page
  And I click the link "Show Details"
  And I should see "Datetime complete"
  And I should see "Best Trial"
  Then I click the first link named "Set Failed"
  Then I should see "Trial was successfully modified."
  And I should see "Datetime complete"
  And I should see "Best Trial"

Scenario: When clicking a study, the study column should be missing
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists a trial
  Then I go to the studies page
  And I click the link "Show Details"
  And I should not see "Study" in the table
  And I click the link "Trials"
  And I should see "Study" in the table

Scenario: If no trials, when click a study, the study column should be missing
  Given I am a valid user and am logged in
  Given there exists a study
  Then I go to the studies page
  And I click the link "Show Details"
  And I should not see "Study" in the table
  And I click the link "Trials"
  And I should see "Study" in the table
