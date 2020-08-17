Feature: Sort Trials
  Test the sorting of trials in the trial's index page

Scenario Outline: Sort Index, Number, Datetime Start, and Datetime Complete
  Given I am a valid user and am logged in
  Given there exists a study
  Given trials with the following values
    | Number | Study | State    | Value  | Datetime Start          | Datetime Complete       |
    | 0      | 1     | COMPLETE | 406.64 | 2020-08-15 00:54:13 UTC | 2020-08-15 01:26:44 UTC |
    | 1      | 1     | COMPLETE | 215.1  | 2020-08-15 00:55:18 UTC | 2020-08-16 02:24:44 UTC |
    | 2      | 1     | RUNNING  |        | 2020-08-16 00:54:13 UTC |                         |
  Then I go to the trials page
  And I should see "406.64" before "215.1"
  Then I click the link with id "<field>-sort"
  And I should see "215.1" before "406.64"
  Then I click the link with id "<field>-sort"
  And I should see "406.64" before "215.1"

  Examples:
   | field             |
   | num               |
   | datetime_start    |
   | datetime_complete |

Scenario: Sort Value
  Given I am a valid user and am logged in
  Given there exists a study
  Given trials with the following values
    | Number | Study | State    | Value  | Datetime Start          | Datetime Complete       |
    | 0      | 1     | COMPLETE | 406.64 | 2020-08-15 00:54:13 UTC | 2020-08-15 01:26:44 UTC |
    | 1      | 1     | COMPLETE | 215.1  | 2020-08-15 00:55:18 UTC | 2020-08-16 02:24:44 UTC |
    | 2      | 1     | RUNNING  |        | 2020-08-16 00:54:13 UTC |                         |
  Then I go to the trials page
  And I should see "406.64" before "215.1"
  Then I click the link with id "value-sort"
  And I should see "406.64" before "215.1"
  Then I click the link with id "value-sort"
  And I should see "215.1" before "406.64"


  Scenario: Sort Value
    Given I am a valid user and am logged in
    Given there exists a study
    Given trials with the following values
      | Number | Study | State    | Value  | Datetime Start          | Datetime Complete       |
      | 0      | 1     | COMPLETE | 406.64 | 2020-08-15 00:54:13 UTC | 2020-08-15 01:26:44 UTC |
      | 1      | 1     | COMPLETE | 215.1  | 2020-08-15 00:55:18 UTC | 2020-08-16 02:24:44 UTC |
      | 2      | 1     | RUNNING  |        | 2020-08-16 00:54:13 UTC |                         |
    Then I go to the trials page
    And I should see "2020-08-15 00:54:13 UTC" before "2020-08-16 00:54:13 UTC"
    Then I click the link with id "state-sort"
    And I should see "2020-08-16 00:54:13 UTC" before "2020-08-15 00:54:13 UTC"
    Then I click the link with id "state-sort"
    And I should see "2020-08-15 00:54:13 UTC" before "2020-08-16 00:54:13 UTC"

Scenario: Sorting does not change the number of columns
  Given I am a valid user and am logged in
  Given there exists a study
  Given there exists 5 trials
  Then I go to the studies page
  Then I click the link "Show Details"
  And I should not see "Study" in the table
  Then I click the link with id "value-sort"
  And I should not see "Study" in the table
